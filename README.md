# 🎓 YZUthesis - 扬州大学学位论文模板

扬州大学学位论文 LaTeX 模板，支持本硕博学位论文撰写与格式排版。

---

## 📁 主要文件说明

| 文件 | 用途 | 说明 |
|------|------|------|
| **`thesis.tex`** | 主论文文件 | 标准学位论文撰写主文件，包含封面、摘要、目录、正文、参考文献等完整结构 |
| **`ThesisForCheck.tex`** | 抽检样式文件 | 专为学位论文抽检设计的格式，隐藏个人信息，保留学术内容 |
| **`build.ps1`** | 编译脚本 | PowerShell 自动编译脚本，支持多种编译选项 |

## 🚀 快速开始

### 基础编译方法
运行以下命令即可生成所有文件：

```powershell
.\build.ps1
```


安全提示 🔒
首次运行 PowerShell 脚本时，系统会显示安全警告：


安全警告
请只运行你信任的脚本。虽然来自 Internet 的脚本会有一定的用处，但此脚本可能会损坏你的计算机。
如果你信任此脚本，请使用 Unblock-File cmdlet 允许运行该脚本，而不显示此警告消息。

是否要运行 D:\texlive\workspace\Templates\YZUThesis\学位论文模板v2\YZUthesis\build.ps1?
[D] 不运行(D)  [R] 运行一次(R)  [S] 暂停(S)  [?] 帮助 (默认值为"D"):
输入 R 并回车即可正常编译。

💡 永久解决方案：如需永久信任此脚本，可运行：

powershell
Unblock-File .\build.ps1

⚙️ 高级编译选项
完整命令语法
powershell
.\build.ps1 [-Action <命令>] [-Engine <引擎>] [-Help | -help | -h]

🔧 可用操作命令 (Action)
命令	功能说明
all	编译所有内容（默认选项）
cls	仅生成 .cls 和 .cfg 样式文件
doc	仅生成模板文档
thesis	编译所有主论文文档
check	仅编译抽检文档
clean	清理临时文件（*.aux, *.log 等）
distclean	完全清理（包括生成的PDF）

🛠️ 可用编译引擎 (Engine)
|引擎|说明|推荐用途|
|------|------|------|
|xelatex|默认|支持中文字体，推荐用于中文论文|
|pdflatex|	|传统引擎，兼容性好|
|lualatex|	|现代引擎，性能优秀|
|latex|	|传统LaTeX	生成DVI格式，需使用 dvipdfmx 转成PDF|

📋 使用示例
powershell
# 1. 默认编译（使用 XeLaTeX 编译所有内容）
.\build.ps1

# 2. 使用特定引擎编译
.\build.ps1 -Engine pdflatex

# 3. 仅编译论文主文件
.\build.ps1 -Action thesis

# 4. 使用 LuaLaTeX 编译论文主文件
.\build.ps1 -Action thesis -Engine lualatex

# 5. 仅清理临时文件
.\build.ps1 -Action clean

# 6. 显示帮助信息
.\build.ps1 -Help
⚡ 当前默认配置
默认编译引擎: xelatex

主文档: thesis.tex, ThesisForCheck.tex

📝 注意事项
编译环境: 建议使用 TeX Live 或 MiKTeX 发行版

字体配置: 使用 XeLaTeX 时，请确保系统已安装所需中文字体

文件编码: 所有 .tex 文件使用 UTF-8 编码

引用文献: 请使用 BibTeX 或 BibLaTeX 管理参考文献


👨‍💻 作者信息
Haifeng XU
📅 更新日期：2026年2月6日

