# 保存为 build.ps1，右键选择"使用 PowerShell 运行"

# ======参数设置====================================================
# 定义脚本的输入参数, 如果不提供参数，默认为"all"（编译所有内容）
# 默认编译引擎为 xelatex
param(
    [string]$Action = "thesis",
    [string]$Engine = "xelatex",
    [switch]$Help = $false
)
# ------------------------------------------------------------------

# ======全局变量====================================================
# 引擎配置
$EngineConfig = @{
    "pdflatex" = @{
        Name = "pdfLaTeX"
        Command = "pdflatex"
        DirectPDF = $true
    }
    "xelatex" = @{
        Name = "XeLaTeX"
        Command = "xelatex"
        DirectPDF = $true
    }
    "lualatex" = @{
        Name = "LuaLaTeX"
        Command = "lualatex"
        DirectPDF = $true
    }
    "latex" = @{
        Name = "LaTeX"
        Command = "latex"
        DirectPDF = $false  # 生成 DVI，需要转换
    }
} 
#
# 主要编译的文档
$MainTexFiles = @("thesis.tex", "ThesisForCheck.tex") 
# ------------------------------------------------------------------

# ==================================================================
# 检查参数是否合法
# ---------------------------------------------------
function Validate-Parameters {
    if ($help -or $h -or $Help) {
        Show-Help
        exit 0
    }
    
    if (-not $EngineConfig.ContainsKey($Engine.ToLower())) {
        Write-Host "错误: 不支持的引擎 '$Engine'" -ForegroundColor Red
        Write-Host "支持的引擎: $($EngineConfig.Keys -join ', ')" -ForegroundColor Yellow
        exit 1
    }
    
    # 获取引擎信息
    $CurrentEngine = $EngineConfig[$Engine.ToLower()]
    Write-Host "使用引擎: $($CurrentEngine.Name) ($($CurrentEngine.Command))" -ForegroundColor Cyan
    Write-Host ""
}
# ------------------------------------------------------------------


# ==================================================================
# Write-Colored 函数用于在控制台输出彩色文字, 使编译过程更直观（绿色成功、红色错误等）
# ---------------------------------------------------
function Write-Colored {
    param([string]$Message, [string]$Color = "White")
    Write-Host $Message -ForegroundColor $Color
}
# ------------------------------------------------------------------

# ==================================================================
# 使用 latex 编译文件 YZUthesis.ins, 使得从 YZUthesis.dtx 文件中
# 生成LaTeX模板文件(YZUthesis.cls和YZUthesis.cfg)
# .ins 被称为安装文件, 结合 .dtx 文件, 在 latex/tex命令下生成 .cfg 和.cls文件
# YZUthesis.cfg 是配置(config)文件
# YZUthesis.cls 是class文件
# 这里 Cyan 是青色
# Test-Path：检查文件是否存在
# ---------------------------------------------------
function Compile-Cls {
    Write-Colored "生成 .cls 和 .cfg 文件..." "Cyan"

    # 生成.cls文件通常使用标准的latex命令
    latex YZUthesis.ins
    
    # 检查是否生成成功
    if (-not (Test-Path "YZUthesis.cls") -or -not (Test-Path "YZUthesis.cfg")) {
        Write-Colored "错误: 未能生成模板文件" "Red"
        return $false
    }
    Write-Colored "成功生成 YZUthesis.cls 和 YZUthesis.cfg" "Green"
    return $true
}
# ------------------------------------------------------------------

# ==================================================================
# 编译模板的使用说明文档
# & $Engine：调用外部程序
# ---------------------------------------------------
function Compile-Doc {
    # For compile YZUthesis.dtx, we use XeLaTeX.
    $Engine="xelatex"
    $CurrentEngine = $EngineConfig[$Engine.ToLower()]

    $engineCmd = $CurrentEngine.Command

    Write-Colored "使用 $($CurrentEngine.Name) 生成模板文档 PDF..." "Cyan"

    # 第一次编译.dtx文件(模板源文件)
    & $engineCmd YZUthesis.dtx  
    
    # 处理索引
    if (Test-Path "YZUthesis.idx") {
        makeindex -s gind.ist -o YZUthesis.ind YZUthesis.idx
    }

    # 处理术语表
    if (Test-Path "YZUthesis.glo") {
        makeindex -s gglo.ist -o YZUthesis.gls YZUthesis.glo
    }
    
    # 再次编译两次以确保交叉引用正确
    & $engineCmd YZUthesis.dtx
    & $engineCmd YZUthesis.dtx

    # 如果是传统LaTeX，需要将DVI转换为PDF
    if (-not $CurrentEngine.DirectPDF) {
        if (Test-Path "YZUthesis.dvi") {
            Write-Colored "将 DVI 转换为 PDF..." "Yellow"
            dvipdfmx YZUthesis.dvi
            if (Test-Path "YZUthesis.pdf") {
                Write-Colored "成功生成 YZUthesis.pdf" "Green"
                return $true
            }
        } else {
            Write-Colored "错误: 未能生成 DVI 文件" "Red"
            return $false
        }
    }
    
    if (Test-Path "YZUthesis.pdf") {
        Write-Colored "成功生成 YZUthesis.pdf" "Green"
        return $true
    } else {
        Write-Colored "错误: 未能生成 YZUthesis.pdf" "Red"
        return $false
    }
}
# ------------------------------------------------------------------

# ==================================================================
# 编译论文主文档
# ---------------------------------------------------
function Compile-TexFile {
    param([string]$texFile)

    $CurrentEngine = $EngineConfig[$Engine.ToLower()]
    $engineCmd = $CurrentEngine.Command
    $baseName = [System.IO.Path]::GetFileNameWithoutExtension($texFile)
    
    Write-Colored "正在使用 $($CurrentEngine.Name) 编译 $baseName.tex..." "Cyan"
    
    # 第一次编译, 生成.aux文件（包含引用信息）
    & $engineCmd $texFile
    
    # 如果存在引用, 运行 bibtex 处理参考文献
    # Get-Content：读取文件内容
    if (Test-Path "$baseName.aux") {
        $auxContent = Get-Content "$baseName.aux"
        if ($auxContent -match "\\citation") {
            bibtex $baseName
        }
    }
    
    # 如果存在 .glo 文件, 则运行 makeindex 处理术语表 
    if (Test-Path "$baseName.glo") {
        makeindex -s gglo.ist -o "$baseName.gls" "$baseName.glo"
    }
    
    # 第二、三次编译
    & $Engine $texFile
    & $Engine $texFile

    # 如果是传统LaTeX，需要将DVI转换为PDF
    if (-not $CurrentEngine.DirectPDF) {
        if (Test-Path "$baseName.dvi") {
            Write-Colored "将 DVI 转换为 PDF..." "Yellow"
            dvipdfmx "$baseName.dvi"
            
            if (Test-Path "$baseName.pdf") {
                Write-Colored "成功生成 $baseName.pdf" "Green"
                return $true
            } else {
                Write-Colored "错误: DVI 转换 PDF 失败" "Red"
                return $false
            }
        } else {
            Write-Colored "错误: 未能生成 DVI 文件" "Red"
            return $false
        }
    }
    
    if (Test-Path "$baseName.pdf") {
        Write-Colored "成功生成 $baseName.pdf" "Green"
        return $true
    } else {
        Write-Colored "错误: 未能生成 $baseName.pdf" "Red"
        return $false
    }
}
# ------------------------------------------------------------------


# ==================================================================
# 清理临时文件, 这些临时文件乃是LaTeX编译过程中生成的
# ---------------------------------------------------
function Clean-Temp {
    Write-Colored "清理临时文件..." "Yellow"
    $extensions = @("aux", "bbl", "blg", "fdb_latexmk", "fls", "hd", "idx", "ilg", "ind", "log", "out", "toc", "synctex", "synctex.gz", "glg", "glo", "gls")
    
    # 根据当前引擎添加特定的临时文件
    $CurrentEngine = $EngineConfig[$Engine.ToLower()]
    if ($Engine -eq "latex") {
        $extensions += @("dvi", "ps")  # 传统LaTeX的中间文件
    } elseif ($Engine -eq "pdflatex") {
        $extensions += @("pdfsync")  # pdfLaTeX可能生成的文件
    }

    foreach ($ext in $extensions) {
        Get-ChildItem -Filter "*.$ext" -ErrorAction SilentlyContinue | Remove-Item -Force
    }
    
    Write-Colored "清理完成" "Green"
}
# ------------------------------------------------------------------

# ==================================================================
# 显示帮助信息
# ---------------------------------------------------
function Show-Help {
    Write-Colored "===========================================" "Cyan"
    Write-Colored "YZUthesis 模板编译系统 (PowerShell 版本)   " "Cyan"
    Write-Colored "===========================================" "Cyan"
    Write-Host ""
    Write-Host "用法: .\build.ps1 [-Action <命令>] [-Engine <引擎>] [-Help | -help | -h]"
    Write-Host ""
    Write-Host "可用命令 (Action):"
    Write-Host ""
    Write-Host "  all             - 编译所有内容"
    Write-Host "  cls             - 只生成 .cls 和 .cfg 文件"
    Write-Host "  doc             - 只生成模板文档"
    Write-Host "  thesis          - 编译所有主文档 (默认)"
    Write-Host "  check           - 只编译检查文档"
    Write-Host "  clean           - 清理临时文件"
    Write-Host "  distclean       - 完全清理"
    Write-Host ""
    Write-Host "可用引擎 (Engine):"
    Write-Host ""
    Write-Host "  pdflatex        - 使用 pdfLaTeX 编译"
    Write-Host "  xelatex         - 使用 XeLaTeX 编译 (默认)"
    Write-Host "  lualatex        - 使用 LuaLaTeX 编译"
    Write-Host "  latex           - 使用传统 LaTeX 编译，生成 DVI 再转 PDF"
    Write-Host ""
    Write-Host "示例:"
    Write-Host ""
    Write-Host "  .\build.ps1                            # 默认编译所有 (xelatex)"
    Write-Host "  .\build.ps1 -Engine pdflatex           # 使用 pdfLaTeX 编译所有"
    Write-Host "  .\build.ps1 -Action thesis -Engine lualatex"
    Write-Host "  .\build.ps1 -Action clean              # 清理临时文件"
    Write-Host "  .\build.ps1 -Help                      # 显示帮助信息"
    Write-Host ""
    Write-Host "当前配置:"
    Write-Host "  默认引擎: xelatex"
    Write-Host "  主文档: $($MainTexFiles -join ', ')"
    Write-Host ""
}
# ------------------------------------------------------------------

# 验证参数
Validate-Parameters

# ==================================================================
# 主逻辑
# ---------------------------------------------------
switch ($Action.ToLower()) {
    "cls" { Compile-Cls }
    "doc" { Compile-Doc }
    "thesis" {
        foreach ($texFile in $MainTexFiles) {
            Compile-TexFile $texFile
        }
    }
    "check" { Compile-TexFile "ThesisForCheck.tex" }
    "clean" { Clean-Temp }
    "distclean" {
        Clean-Temp
        # Remove-Item -Force YZUthesis.cls, YZUthesis.cfg, YZUthesis.pdf -ErrorAction SilentlyContinue

	# 删除所有可能的中间文件
        $extensions = @("dvi", "ps", "xdv")
	foreach ($ext in $extensions) {
            Get-ChildItem -Filter "*.$ext" -ErrorAction SilentlyContinue | Remove-Item -Force
        }

	# 删除所有生成的 PDF 文件
        foreach ($texFile in $MainTexFiles) {
            $pdfFile = [System.IO.Path]::ChangeExtension($texFile, "pdf")
            Remove-Item -Force $pdfFile -ErrorAction SilentlyContinue
        }
        Write-Colored "完全清理完成" "Green"
    }
    "help" { Show-Help }
    "all" {
        Compile-Cls
        Compile-Doc
        foreach ($texFile in $MainTexFiles) {
            Compile-TexFile $texFile
        }
    }
    default {
        Write-Colored "未知命令: $Action" "Red"
        Write-Host "使用 .\build.ps1 -Help 查看可用命令"
    }
}
# ------------------------------------------------------------------