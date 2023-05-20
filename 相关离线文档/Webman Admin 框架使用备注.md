## Webman Admin 框架使用备注
### 表单like搜索
```html
<div class="layui-form-item">
    <label class="layui-form-label">昵称</label>
    <div class="layui-input-block">
        <input type="text" name="nickname[]" value="like" hidden="">
        <input type="text" name="nickname[]" value="" class="layui-input">
    </div>
</div>
```
> 添加一个name和自己一样的，并且，后面加[]改为数组，value改为like,<,>,
> 

### 控制器中新添加的方法，需要先到菜单管理页中刷新一下，才可以在角色管理页中进行分配
> 因为，菜单管理中，进行了 `\plugin\admin\app\controller\RuleController::syncRules` 方法的调用

### 将代码生成的控制器及模型放在/app下
在生成时删除前面的/plugin/admin，这样的好处在于，可以不污染plugin/admin插件，后期更新升级方便，但为了使用后台鉴权，还需要配置如下：
```php
config/middleware.php:
return [
    // 本地应用使用统一的webman/admin管理后台鉴权
    '' => [
        plugin\admin\api\Middleware::class
    ],
];
```
> 将本地的全部应用，使用admin插件的中间件进行鉴权


### 数据权限
1.控制器中设置$this->dataLimit = "auth";
```php
    public function __construct()
    {
        $this->dataLimit = "auth";
    }
```
> * null 不做限制，任何管理员都可以查看该表的所有数据
> * auth 管理员能看到自己以及自己的子管理员插入的数据
> * personal 管理员只能看到自己插入的数据

2. 每个数据表中必须要有一个字段来标识这条数据是谁插入的，一般这个字段默认叫 admin_id，保存插入的人的id
3. 当设置为auth时，可以自己以及自己的子的数据，原理在于，wa_roles表中,每个角色都是有上下级关系的，在添加角色时，可以看到
4. 查询时，就是获取自己及子的role_id，使用

```php
$where[$this->dataLimitField] = ['in', Auth::getScopeAdminIds(true)];

```
> 这里的 $this->dataLimitField 一般为 admin_id,可自定义字段
>
> 具体逻辑在：
\plugin\admin\app\controller\Crud::selectInput
