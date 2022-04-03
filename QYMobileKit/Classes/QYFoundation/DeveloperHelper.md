#  开发者使用文档
##自定义类、分类、辅助类、全局方法使用原则
非必要不要新建自定义类，非必要不要新辅助类，尽可能使用分类扩展系统已有的类，减少工程的复杂度，减少工程使用的类。
根据功能需求来决定是使用自定义类还是分类，还是其他，比如为了方便获取app的displayName，我们可以创建一个辅助类去获取，但是如果你的需求除了获取displayName之外，还使用了NSBundle的其他方法，这个时候你除了使用辅助类之外还需要再次创建NSBundle的对象，增加了代码的复杂度，为了精简代码，我们只需要给NSBundle扩展一个分类。
 
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

