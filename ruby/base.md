##注释

```
#Returns the full title on a per-page basis.
def full_title(page_title)
  .
  .
  .
end

17 + 42 #Integer addition

```

##字符串

```
“” #空字符串
“foo” #非空的字符串

>> "foo" + "bar" #字符串连接
=> "foobar"

>> first_name ="Bluesand"
=> "Bluesand"

# （#{}）
>>"#{first_name} Roann"
=> "Bluesand Roann" 

# 打印字符串
>> puts "foo" 
foo
=>nil
#puts "foo" 首先会将字符串打印到屏幕上，然后再返回空值字面量：nil 是 Ruby 中的“什么都没有”。

>> print "foo" # 打印字符串（和 puts 类似，但没有添加换行符）
foo => nil

>> print "foo\n"  # 和 puts "foo" 一样
=> nil

#单引号字符串,Ruby不会对单引号字符串进行插值操作:
>> '#{foo}'
==> "\#{foo} bar" #注意控制台是如何使用双引号返回结果的，需要使用反斜线转义特殊字符，例如 #。

#单引号字符串的用处在于它们真的就是字面值，只包含你输入的字符。如：(\n)
>> '\n'
=> "\\n"

```

##对象及向其船体消息

```
#Ruby中一切都是对象，包括字符串和nil都是。

#方法
>> "bluesand".length
=> 8

#查看对象的所有方法
>> "bluesand".methods
=> [:<=>, :==, :===,...]

#empty?方法末尾的问号，这是Ruby的一个约定，说明方法返回值是布尔值: true 或 false。
>>"bluesand".empty?
=>false
>>"".empty?
=>true

>> nil.to_s
=>""

#方法串联(chain)
>> nil.to_s.empty? #消息串联
=> true
#nil本身无法响应empty？方法
>> nil.empty?
NoMethodError: undefined method `empty?' for nil:NilClass

#Ruby中nil的特殊性，除了false本身之外，所有的ruby对象它是唯一一个布尔值为false的，包括0.
>> if nil
>>  true
>> else
>>  false
>> end
=> false
```

##方法

```
#Ruby会非显式的返回值，也支持显式的指定返回值，以下两种效果一样。
>> def string_message(string)
>>   if string.empty?
>>     "It's an empty string!"
>>   else
>>     "The string is nonempty."
>>   end
>> end
=> nil
>> puts string_message("")
It\'s an empty string!
>> puts string_message("foobar")
The string is nonempty.

>> def string_message(string)
>>   return "It's an empty string!" if string.empty?
>>   return "The string is nonempty."
>> end
```

##数组和Range

```
>> "fooxbarxbazx".split('x')
=> ["foo", "bar", "baz"]

>> a = [42, 8, 17]
=> [42, 8, 17]
>> a[0]               # Ruby 使用方括号获取数组元素
=> 42
>> a[1]
=> 8
>> a[2]
=> 17
>> a[-1]              # 索引还可以是负数
=> 17

>> a                  # 只是为了看一下 a 的值是什么
=> [42, 8, 17]
>> a.first            #Ruby为一些常用的元素获取操作提供了别名
=> 42
>> a.second
=> 8
>> a.last
=> 17
>> a.last == a[-1]    # 用 == 进行对比
=> true

>> a
=> [42, 8, 17]
>> a.sort
=> [8, 17, 42]
>> a.reverse
=> [17, 8, 42]
>> a.shuffle
=> [17, 42, 8]
>> a
=> [42, 8, 17]

>> a
=> [42, 8, 17]
>> a.sort!             #对应的！方法会修改a的值
=> [8, 17, 42]
>> a
=> [8, 17, 42]

#可以使用 push 方法向数组中添加元素，或者使用等价的 << 操作符：
>> a.push(6)                  # 把 6 加到数组结尾
=> [42, 8, 17, 6]
>> a << 7                     # 把 7 加到数组结尾
=> [42, 8, 17, 6, 7]
>> a << "foo" << "bar"        # 串联操作
=> [42, 8, 17, 6, 7, "foo", "bar"]

#join
>> a
=> [42, 8, 17, 7, "foo", "bar"]
>> a.join                       # 没有连接符
=> "428177foobar"
>> a.join(', ')                 # 连接符是一个逗号和空格
=> "42, 8, 17, 7, foo, bar"

#Range
>> 0..9
=> 0..9
>> 0..9.to_a              # 错了，to_a 在 9 上调用了
NoMethodError: undefined method `to_a\' for 9:Fixnum
>> (0..9).to_a            # 调用 to_a 要用括号包住 Range
=> [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

Range 经常被用来获取一组数组元素,也可以使用字母
>> a = %w[foo bar baz quux]         # %w 创建一个元素为字符串的数组
=> ["foo", "bar", "baz", "quux"]
>> a[0..2]
=> ["foo", "bar", "baz"]

>> ('a'..'e').to_a
=> ["a", "b", "c", "d", "e"]

```

##块

```
#数组和Range可以响应的方法中有很多都可以跟着一个块(block)
>> (1..5).each{|i| puts 2*i}
2
4
6
8
10
=>1..5
#我们会遵照一个常用的约定，当块只有一行简单的代码时使用花括号形式；当块是一行很长的代码，或者多行时使用 do..end 形式：
>> (1..5).each do |number|
?>   puts 2 * number
>>   puts '--'
>> end
2
--
4
--
6
--
8
--
10
--
=> 1..5

#times , map
>> 3.times { puts "Betelgeuse!" }   # 3.times 后跟的块没有变量
"Betelgeuse!"
"Betelgeuse!"
"Betelgeuse!"
=> 3
>> (1..5).map { |i| i**2 }          # ** 表示幂
=> [1, 4, 9, 16, 25]
>> %w[a b c]                        # 再说一下，%w 可以创建元素为字符串的数组
=> ["a", "b", "c"]
>> %w[a b c].map { |char| char.upcase }
=> ["A", "B", "C"]
>> %w[A B C].map { |char| char.downcase }
=> ["a", "b", "c"]

```

##Hash 和 Symbol

```
#Hash 本质上就是数组，只不过它的索引不局限于使用数字。
#Hash 的索引（或者叫“键”）几乎可以是任何对象。

>> user = {}                          # {} 是一个空 Hash
=> {}
>> user["first_name"] = "Michael"     # 键为 "first_name"，值为 "Michael"
=> "Michael"
>> user["last_name"] = "Hartl"        # 键为 "last_name"，值为 "Hartl"
=> "Hartl"
>> user["first_name"]                 # 获取元素的方式类似数组
=> "Michael"
>> user                               # Hash 的字面量形式
=> {"last_name"=>"Hartl", "first_name"=>"Michael"}


#Symbol 看起来像字符串，只不过没有包含在一对引号中，而是在前面加一个冒号。
#例如，:name 就是一个 Symbol。
#挺像Erlang中的原子类型
>> "name".split('')
=> ["n", "a", "m", "e"]
>> :name.split('')
NoMethodError: undefined method `split' for :name:Symbol
>> "foobar".reverse
=> "raboof"
>> :foobar.reverse
NoMethodError: undefined method `reverse' for :foobar:Symbol

>> user = { :name => "Michael Hartl", :email => "michael@example.com" }
=> {:name=>"Michael Hartl", :email=>"michael@example.com"}
>> user[:name]              # 获取 :name 对应的值
=> "Michael Hartl"
>> user[:password]          # 获取一个未定义的键对应的值
=> nil

#Ruby 1.9新的句法
>> h1 = { :name => "Michael Hartl", :email => "michael@example.com" }
=> {:name=>"Michael Hartl", :email=>"michael@example.com"}
>> h2 = { name: "Michael Hartl", email: "michael@example.com" }
=> {:name=>"Michael Hartl", :email=>"michael@example.com"}
>> h1 == h2
=> true

#Hash 元素的值可以是任何对象，甚至是一个 Hash
>> params = {}        # 定义一个名为 params（parameters 的简称）的 Hash
=> {}
>> params[:user] = { name: "Michael Hartl", email: "mhartl@example.com" }
=> {:name=>"Michael Hartl", :email=>"mhartl@example.com"}
>> params
=> {:user=>{:name=>"Michael Hartl", :email=>"mhartl@example.com"}}
>>  params[:user][:email]
=> "mhartl@example.com"

#与数组和 Range 一样，Hash 也可以响应 each 方法。
>> flash = { success: "It worked!", error: "It failed." }
=> {:success=>"It worked!", :error=>"It failed."}
>> flash.each do |key, value|
?>   puts "Key #{key.inspect} has value #{value.inspect}"
>> end
Key :success has value "It worked!"
Key :error has value "It failed."

#inspect方法，返回被调用对象的字符串字面量表现形式。
>> puts (1..5).to_a            # 把数组作为字符串输出
1
2
3
4
5
>> puts (1..5).to_a.inspect    # 输出一个数组字面量形式
[1, 2, 3, 4, 5]
>> puts :name, :name.inspect
name
:name
>> puts "It worked!", "It worked!".inspect
It worked!
"It worked!"

>> p :name             # 等价于 puts :name.inspect
:name

```

##类.构造器

```
#Ruby 和其他面向对象（object-oriented）编程语言一样，使用类来组织方法。
#然后实例化（instantiate）类创建对象。如果你刚接触面向对象编程，
#这些都似天书一般，那么让我们来看一些实际的例子吧。

>> s = "foobar"       # 使用双引号的字面构造器
=> "foobar"
>> s.class            # 可以响应 class 方法，返回的结果是字符串所属的类。
=> String

#具名构造器（named constructor），即在类名上调用 new 方法：
>> s = String.new("foobar")   # 字符串的具名构造器
=> "foobar"
>> s.class
=> String
>> s == "foobar"
=> true

#在类上调用 new 得到的结果是这个类的一个对象，也叫做这个类的实例（instance）。
#在实例上调用的方法，例如 length，叫做实例方法（instance method）。

```

##类.继承

```
>> s = String.new("foobar")
=> "foobar"
>> s.class                        # 查找 s 所属的类
=> String
>> s.class.superclass             # 查找 String 的父类
=> Object
>> s.class.superclass.superclass  # Ruby 1.9 使用 BasicObject 作为基类
=> BasicObject
>> s.class.superclass.superclass.superclass
=> nil

#Word
>> class Word
>>   def palindrome?(string)
>>     string == string.reverse
>>   end
>> end
=> nil

>> w = Word.new              # 创建一个 Word 对象
=> #<Word:0x22d0b20>
>> w.palindrome?("foobar")
=> false
>> w.palindrome?("level")
=> true

#继承String
>> class Word < String             # Word 继承自 String
>>   # 如果字符串和自己反转后相等则返回 true
>>   def palindrome?
>>     self == self.reverse        # self 代表这个字符串本身
>>   end
>> end
=> nil

>> s = Word.new("level")    # 创建一个新的 Word，初始值为 level
=> "level"
>> s.palindrome?            # Word 实例可以响应 palindrome? 方法
=> true
>> s.length                 # Word 实例还继承了字符串所有的常规方法
=> 5

#word继承关系
>> s.class
=> Word
>> s.class.superclass
=> String
>> s.class.superclass.superclass
=> Object

```

##修改内置类

```
##Ruby允许你这样操作原生类，但不推荐啊，不推荐。
>> class String
>>   # 如果字符串和自己反转后相等则返回 true
>>   def palindrome?
>>     self == self.reverse
>>   end
>> end
=> nil
>> "deified".palindrome?
=> true
```
