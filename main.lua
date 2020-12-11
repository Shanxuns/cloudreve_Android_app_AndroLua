--[[

闪讯出品

cloudreve免费客服端 适配v3.1
使用请注释版权

作者QQ: 2895991648
或者 闪讯通讯 http://im.shanxuns.cn/ 
付费版 499 元 功能更快更完善。


]]--




require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "java.io.File"
import 'android.graphics.Typeface'
import "com.open.lua.adapter.LuaBaseAdapter"

import "android.support.v7.widget.AppCompatCheckBox"


import "android.support.v4.widget.*"

import "cjson"

import "android.view.animation.DecelerateInterpolator"
import "android.animation.AnimatorSet"
import "android.animation.ObjectAnimator"
import "Shanxun"


--带v4的Glide
import "com.bumptech.glide.*"
import "com.bumptech.glide.request.transition.ViewPropertyAnimationFactory"
import "com.bumptech.glide.load.engine.DiskCacheStrategy"
import "com.bumptech.glide.request.target.SimpleTarget"
import "com.bumptech.glide.load.resource.bitmap.BitmapTransformation"


import "android.graphics.Matrix"
import "android.graphics.Bitmap"
import "android.renderscript.Allocation"
import "android.renderscript.Element"
import "android.renderscript.ScriptIntrinsicBlur"
import "android.renderscript.RenderScript"

--import "me.everything.android.ui.overscroll.*"
import "API"

import "android.content.pm.PackageManager"


import "common"

function 写入文件(路径,内容)
  import "java.io.File"
  f=File(tostring(File(tostring(路径)).getParentFile())).mkdirs()
  io.open(tostring(路径),"w"):write(tostring(内容)):close()
end
if File(key_dir).exists() then
  key=io.open(key_dir):read("*a")
 else
  key=""
end
Http.get("http://119.23.62.179:1314/ATT?key="..key,cookie,charset,header,function(code,content,cookie,header)
  if code==200 then
    import "cjson"
    import "java.io.File"
    content=cjson.decode(content)
    if content["code"]==0 then
      url=content["url"]
      io.open(md5_dir,"w"):write(string.md5(url.."shanxun")):close()
      io.open(url_dir,"w"):write(url):close()
     else
    end
  end
end)


function 动画加载_dialog()
  import "android.view.WindowManager"
  import "android.view.Gravity"
  import "android.widget.ProgressBar"
  import "android.graphics.drawable.ColorDrawable"
  import "android.app.AlertDialog"
  AlertDialogLayout={
    LinearLayout,
    orientation="vertical",
    layout_width="fill",
    layout_height="fill",
    {
      LinearLayout,
      layout_height="-2",
      layout_width="fill",
      orientation="vertical",
      layout_marginRight="5dp";
      layout_marginLeft="5dp";
      id="dc",
      {
        LinearLayout;
        layout_margin="5dp";
        layout_width="fill";
        layout_height="fill";
        background="#ffffffff";
        gravity="center";
        id="加载布局";
        {
          ProgressBar;
          style="?android:attr/progressBarStyleSmall";
          layout_margin="12dp";
          id="加载进度条";
        };
        {
          TextView;
          layout_width="-1";
          textSize="12sp";
          text=Text[1];
          Typeface=Typeface.createFromFile(File(activity.getLuaDir()..'/TTF/a.ttf'));
        };
      };
    },
  }

  dialog= AlertDialog.Builder(this)

  dialog2=dialog.show()

  dialog2.getWindow().setContentView(loadlayout(AlertDialogLayout));

  dialog2.getWindow().setBackgroundDrawable(ColorDrawable(0x00000000));

  dialogWindow = dialog2.getWindow();
  dialogWindow.setGravity(Gravity.TOP);
  dialog2.setCancelable(false)
  dialog2.setCanceledOnTouchOutside(false)
  dialog2.getWindow().getAttributes().width=(activity.Width);
  dialog2.getWindow().clearFlags(WindowManager.LayoutParams.FLAG_ALT_FOCUSABLE_IM);
  dialog2.getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_STATE_ALWAYS_VISIBLE);
  dialog2.getWindow().setFlags(WindowManager.LayoutParams.FLAG_ALT_FOCUSABLE_IM,WindowManager.LayoutParams.FLAG_ALT_FOCUSABLE_IM);
  radiu=35
  Shanxun.控件圆角(dc,0xffffffff,{radiu,radiu,radiu,radiu,radiu,radiu,radiu,radiu})
end

activity.setRequestedOrientation(1);--竖屏
--这个需要系统SDK21以上才能用
if Build.VERSION.SDK_INT >= 21 then
  activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS).setStatusBarColor(0xff4285f4);
end
--这个需要系统SDK19以上才能用
if Build.VERSION.SDK_INT >= 19 then
  activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS);
end
function 权限_dialog(mArray)

  import "android.view.WindowManager"
  import "android.view.Gravity"
  import "android.widget.ProgressBar"
  import "android.graphics.drawable.ColorDrawable"
  import "android.app.AlertDialog"
  AlertDialogLayout={
    LinearLayout,
    orientation="vertical",
    layout_width="fill",
    layout_height="fill",
    {
      LinearLayout,
      layout_height="-2",
      layout_width="fill",
      orientation="vertical",
      id="dc",
      {
        TextView;
        layout_width="-1";
        textSize="15sp";
        text=Text[5];
        layout_marginTop="10dp";
        layout_marginLeft="15dp";
        layout_marginRight="15dp";
        textColor="0xff000000";
        Typeface=Typeface.createFromFile(File(activity.getLuaDir()..'/TTF/a.ttf'));
      };
      {
        ScrollView;
        layout_width="-1";
        layout_height="-1";
        layout_marginTop="15dp";
        {
          LinearLayout;
          layout_height="-2";
          layout_width="-1";
          orientation="vertical",
          {
            TextView;
            layout_width="-1";
            textSize="12sp";
            text=Text[2];
            layout_marginTop="5dp";
            layout_marginLeft="25dp";
            layout_marginRight="25dp";
            Typeface=Typeface.createFromFile(File(activity.getLuaDir()..'/TTF/a.ttf'));
            id="text";
          };
          {
            LinearLayout,
            layout_width="-1";
            {
              Button,
              text=Text[3],
              layout_width="-1",
              id="button_同意";
              layout_weight="1";
              layout_margin="10dp";
              textColor="0xFFFFFFFF";
              layout_height="5%h";
            };
            {
              Button,
              text=Text[4],
              layout_width="-1",
              id="button_不同意";
              layout_weight="1";
              layout_margin="10dp";
              textColor="0xFFFFFFFF";
              layout_height="5%h";
            };
          };
        };
      };
    },
  }

  dialog= AlertDialog.Builder(this)

  dialog1=dialog.show()

  dialog1.getWindow().setContentView(loadlayout(AlertDialogLayout));

  dialog1.getWindow().setBackgroundDrawable(ColorDrawable(0x00000000));

  dialogWindow = dialog1.getWindow();

  dialogWindow.setGravity(Gravity.BOTTOM);
  dialog1.setCancelable(false)
  dialog1.setCanceledOnTouchOutside(false)
  dialog1.getWindow().getAttributes().width=(activity.Width);
  dialog1.getWindow().clearFlags(WindowManager.LayoutParams.FLAG_ALT_FOCUSABLE_IM);
  dialog1.getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_STATE_ALWAYS_VISIBLE);
  dialog1.getWindow().setFlags(WindowManager.LayoutParams.FLAG_ALT_FOCUSABLE_IM,WindowManager.LayoutParams.FLAG_ALT_FOCUSABLE_IM);
  radiu=30
  Shanxun.控件圆角(dc,0xffffffff,{radiu,radiu,radiu,radiu,0,radiu,0,radiu})
  radiu=360
  Shanxun.控件圆角(button_同意,0xFF85C388,{radiu,radiu,radiu,radiu,radiu,radiu,radiu,radiu})
  radiu=360
  Shanxun.控件圆角(button_不同意,0xFFF25D87,{radiu,radiu,radiu,radiu,radiu,radiu,radiu,radiu})

  text.setLineSpacing(0,1.5);
  button_同意.onClick=function(v)
    activity.requestPermissions(mArray,0)
    dialog1.dismiss()
  end
  button_不同意.onClick=function(v)
    activity.moveTaskToBack(true)
  end
end

function ApplicationAuthority()

  local mAppPermissions = ArrayList()

  local mAppPermissionsTable = luajava.astable(activity.getPackageManager().getPackageInfo(activity.getPackageName(),PackageManager.GET_PERMISSIONS).requestedPermissions)
  for k,v in pairs(mAppPermissionsTable) do
    permissions=activity.checkCallingOrSelfPermission(tostring(v))
    if permissions==-1 and not(v=="android.permission.UNKNOWN")then
      mAppPermissions.add(v)
    end
  end
  local size = mAppPermissions.size()
  if size >2 then
    local mArray = mAppPermissions.toArray(String[size])
    权限_dialog(mArray)
   else
    动画加载_dialog()
    Api.user(url,cookie_dir,
    function(content)
      dialog2.dismiss()
      activity.newActivity("mains",android.R.anim.fade_in,android.R.anim.fade_out,{content})
      activity.finish()
    end,
    function(content)
      dialog2.dismiss()
      activity.newActivity("login",android.R.anim.fade_in,android.R.anim.fade_out)
      activity.finish()
    end)
  end
end





ApplicationAuthority()

onRequestPermissionsResult=function(r,p,g)
  动画加载_dialog()
  Api.user(url,cookie_dir,
  function(content)
    dialog2.dismiss()
    activity.newActivity("mains",android.R.anim.fade_in,android.R.anim.fade_out,{content})
    activity.finish()
  end,
  function(content)
    dialog2.dismiss()
    activity.newActivity("login",android.R.anim.fade_in,android.R.anim.fade_out)
    activity.finish()
  end)
end

