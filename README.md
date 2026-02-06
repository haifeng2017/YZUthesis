# YZUthesis
A thesis template for Yangzhou University.

## Main files
thesis.tex  学位论文主文件
ThesisForCheck.tex 学位论文抽检样式主文件

## compile
运行 build.ps1 即可得到所有文件.

### 安全警告
在命令行提示符下, 运行 build.ps1 时, 会显示下面的安全警告:

安全警告
请只运行你信任的脚本。虽然来自 Internet 的脚本会有一定的用处，但此脚本可能会损坏你的计算机。如果你信任此脚本，请使用
Unblock-File cmdlet 允许运行该脚本，而不显示此警告消息。是否要运行
D:\texlive\workspace\Templates\YZUThesis\学位论文模板v2\YZUthesis\build.ps1?
[D] 不运行(D)  [R] 运行一次(R)  [S] 暂停(S)  [?] 帮助 (默认值为“D”):

此时输入 R 并回车即可生成所有所需的文件.

### build.ps1 的用法
build.ps1 后面可以加参数, 使用方法如下:


用法: .\build.ps1 [-Action <命令>] [-Engine <引擎>] [-Help | -help | -h]

可用命令 (Action):

  all             - 编译所有内容 (默认)
  cls             - 只生成 .cls 和 .cfg 文件
  doc             - 只生成模板文档
  thesis          - 编译所有主文档
  check           - 只编译检查文档
  clean           - 清理临时文件
  distclean       - 完全清理

可用引擎 (Engine):

  pdflatex        - 使用 pdfLaTeX 编译
  xelatex         - 使用 XeLaTeX 编译 (默认)
  lualatex        - 使用 LuaLaTeX 编译
  latex           - 使用传统 LaTeX 编译，生成 DVI 再转 PDF

示例:

  .\build.ps1                            # 默认编译所有 (xelatex)
  .\build.ps1 -Engine pdflatex           # 使用 pdfLaTeX 编译所有
  .\build.ps1 -Action thesis -Engine lualatex
  .\build.ps1 -Action clean              # 清理临时文件
  .\build.ps1 -Help                      # 显示帮助信息

当前配置:
  默认引擎: xelatex
  主文档: thesis.tex, ThesisForCheck.tex


## Author
Haifeng XU

## Date
2026-02-6
