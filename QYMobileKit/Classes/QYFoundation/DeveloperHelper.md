#  开发者使用文档
##自定义类、分类、辅助类（工厂类）、全局方法使用原则
尽可能不使用全局方法，全局方法不符合面向对象编程的思想，也容易导致方法重名，优先使用类来封装方法，当有些方法无法抽象成一个类的情况才使用全局方法，使用全局方法时，方法名必须要加前缀，以防方法名冲突；
分析功能需求，把这些功能抽象成一个类，如果这个类不需要实例化，也不需要存储信息，没有属性，只有方法，这种情况可以封装成工厂类，类名不用util这种方式命名，以功能对应的英文命名，例如：NSJSONSerialization；
如果要实现的功能抽象成类，这个类已经存在，则使用分类扩展已存在的类，例如通过字符串生成NSDate，这种功能类似系统方法+ (instancetype)dateWithTimeIntervalSince1970:(NSTimeInterval)secs，为了把相似功能放在同一个类，可以使用分类；
另外如果要实现的方法参数就是系统的某个类型，为了减少方法使用的参数，可以使用分类，例如NSData加密，加密前NSData+key = 加密后NSData，如果用工厂类方法来实现，需要传入2个参数，加密前Data 和 key，如果扩展NSData则只需要传入key，减少方法使用的复杂度。
如果要实现的功能抽象成一个类，这个类是不存在的，则需要生成一个自定义类，如果这个类在整个app中只允许有一个实例的，则把这个类定义为单例（UIApplication），如果这个类可以有多个实例，但是有一个最常用的实例，可以定义一个类的属性，以方便生成这个常用的实例，例如类NSBundle，它的常用实例@property (class, readonly, strong) NSBundle *mainBundle;mainBundle是一个全局生命周期的类属性，但是NSBundle不是单例，它可以有其他的实例，也有很多方法生成NSBundle的实例。
 
##文件命名规则
分类的文件名，不按新建Category模版命名，以功能模块+Utilities命名，egg：QY+功能+Utilities。
全局方法文件名，命名规则跟分类一样，把所有实现这种功能的方法都放在这个文件里。
自定义类文件名，前缀+功能模块的方式命名。

##分类命名规则
分类名以前缀+功能模块+Extensions方式命名，egg：
@interface NSBundle (QYBundleInfoDictionaryExtensions)
BundleInfoDictionary是功能模块，意思是实现BundleInfoDictionary功能的扩展
分类属性命名：属性容易重名，为了防止命名冲突，属性后面加ForQY
egg：@property (readonly, copy) NSString *displayNameForQY;

