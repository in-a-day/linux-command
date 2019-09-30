## vim 常用命令

### **可视模式**
1. `vit` 选中标签内内容
2. `gv` 复选上一次选择
3. `o` 切换高亮选中的活动端(即非光标定位的一端),切换后, 该端作为选中的起始端

### **插入模式**
1. `<C-r>{register}` 插入寄存器内容
2. `<C-r><C-p>{register}` 插入寄存器内容
3. `<C-r>={expression}` 计算表达式的值并插入,例<C-r>=1+1, 将插入2.
4. `<C-v>{code}` ASCII码对应字符, 3位及以内, 如<C-v>065, 插入A
5. `<C-v>u{code}` ASCII码对应字符, 4位及以上
6. `<C-k>{char1}{char2} 二合字母, `:digraphs`查看, `:h digraph-table`, `:h digraphs-default`

### **命令行模式**
1. 命令行下可以使用`<C-r>{register}`插入寄存器内容
2. `<C-k>`和`<C-v>`输入特殊字符
3. `.`: 当前行, `%`: 全部行, `$`: 最后一行
4. `'<`: 可视模式选中的首行, `'>`: 可视模式选中末行, 即使退出可视模式任保留.
5. `/{pattern1}/,/{pattern2}/` 匹配开始的pattern, 到结束的pattern, 与输入`num1, num2`相同.
6. Offset(偏移), 相对于给定行的偏移, 如: `1,5+3`(第1行到第8行, 也可使用-减号), `.,/{pattern}/-1`(当前行到匹配模式的前一行)


命令 | 用途
--- | ---
`:[range]delete[x]` | 删除指定行[到寄存器x]
`:[range]yank[x]` | 复制指定行[到寄存器x]
`:[line]put[x]` | 在指定行后粘贴寄存器x内容
`:[range]copy[address]` (缩写:t) | 复制指定行到指定地址下
`:[range]move[address]` (缩写:m) | 移动指定行到指定地址下
`:[range]join` | 连接指定的行
`:[range]normal{commands}` | 在每个指定的行执行正常模式{command}
`:[range]substitute/{pattern}/{string}/[flags]` | 指定行用字符串替换匹配的模式
`:[range]global/{pattern}/[cmd]` | 在匹配的指定行执行Ex命令[cmd]
`:tabnew` | 新建窗口, 有`split`不同, 新建的是一个空窗口
`:prev/:next` | ???
`:bprev/bnext` | 缓冲区中的上一个/下一个

- `[range]`可用模式:
  1. 数字: 1,3 1到3行
  2. pattern(模式): /{pat1}/, /{pat2}/ 表示匹配pat1到pat2之间行
  3. mark(标记): 'm1,'m2 包含标记m1到标记m2之间行
- `[range]`特殊:
  1. `.` 当前行
  2. `$` 最后行
  3. `'<` 可视模式的第一行, `'>`可视模式的最后一行
  4. `%` 全部行
  5. `'m` 包含标记m的行
  6. `0` 虚拟的在文件首行之上的行
  7. `1` 第一行
  8. offset(偏移) `.,.+3`当前行到当前行的下3行, `/{pat1}/+1,/{pat2}/-1`匹配pat1的下一行到匹配pat2的上一行
  9. 当`[range]`省略时, 默认代表当前行


### **.命令**
1. `.` 命令重复上一次动作
2. 从插入模式到正常模式的所有动作都将被重复
3. `.` 命令相当于一个微型宏
4. `.范式`: 一键移动, 一键执行

### **分割窗口**
1. `:split(sp)` 默认分割当前文件, 窗口为纵向分割
2. `:vsplit(vsp)` 横向分割

### **重复命令及其恢复命令**
内容 | 命令 | 重复 | 恢复
-- | -- | -- | --
修改 | {edit} | . | u
行查询下一个字符 | f{char}/t{char} | ; | ,
行查询上一个字符 | F{char}/T{char} | ; | ,
文档查询下一处匹配 | /pattern | n | N
文档查询上一处匹配 | ?pattern | n | N
替换 | s/target/replacement | & | u
执行一系列修改 | qx{changes}q | @x | u

@: 可以重复任意的Ex命令  
:substitute 命令可以使用&重复执行上一次命令  

### **Operator + Motion = Action**
operator | 用途
--- | ---
c | 改变
d | 删除
y | 复制到寄存器
g~ | 交换大小写
gu | 小写
gU | 大写
gq | 文本格式化
g? | ROT13编码(只对字母编码, 用当前字母向前数的第13个字母替换当前字母)
g@ | 设置以`operatorfunc`选项调用方法
zf | 定义折叠
~ | 交换大小写(只有设置了`tildeop`才行)
\> | 👉缩进
\< | 👈缩进
= | 自动缩进
! | 使用外部程序过滤{motion}所跨的行


### 替换
1. `%s/pattern/replacement/gc` c会提示是否替换

### 提取文件到编辑器中
1. `r fileName` 
2. `r !ls` 将ls输出提取到编辑器中

