
require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "java.io.File"
import "common"
import 'android.graphics.Typeface'
import "com.open.lua.adapter.LuaBaseAdapter"
import "android.support.v7.widget.AppCompatCheckBox"

import "com.gauravk.audiovisualizer.visualizer.*"

import "android.support.v4.widget.*"

import "cjson"
--导入RecyclerView
import "android.support.v7.widget.*"

--导入open写的RecyclerView的接口(作废)
import "com.open.lua.adapter.LuaRecyclerViewAdapter"
import "com.xlua.widget.*"

import "android.view.animation.DecelerateInterpolator"
import "android.animation.AnimatorSet"
import "android.animation.ObjectAnimator"
import "Shanxun"
import "item"

import "API"

((ction dpTopx(sdp)
  import "android.util.TypedValue"
  dm=this.getResources().getDisplayMetrics()
  types={px=0,dp=1,sp=2,pt=3,["in"]=4,mm=5}
  n,ty=sdp:match("^(%-?[%.%d]+)(%a%a)$")
  return TypedValue.applyDimension(types[ty],tonumber(n),dm)
end

activity.setTheme(android.R.style.Theme_Material_Light)
activity.ActionBar.hide()
activity.getWindow().getDecorView().setSystemUiVisibility(View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN|View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR)
activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS).setStatusBarColor(0x00000000);
activity.overridePendingTransition(android.R.anim.fade_in,android.R.anim.fade_out)
activity.setContentView(loadlayout("layout"))
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
          text=Text[25];
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
function 公告_dialog(title,content)
  require "import"
  import "android.view.WindowManager"
  import "android.view.Gravity"
  import "android.widget.ProgressBar"
  import "android.graphics.drawable.ColorDrawable"
  import "android.app.AlertDialog"
  import "Shanxun"
  import "android.text.Html"
  import "android.text.method.LinkMovementMethod"
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
        text=title;
        layout_marginTop="10dp";
        layout_marginLeft="15dp";
        layout_marginRight="15dp";
        textColor="0xff000000";
        Typeface=Typeface.createFromFile(File(activity.getLuaDir()..'/TTF/f.ttf'));
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
            layout_marginTop="5dp";
            layout_marginLeft="25dp";
            layout_marginRight="25dp";
            Typeface=Typeface.createFromFile(File(activity.getLuaDir()..'/TTF/f.ttf'));
            id="text";
          };
          {
            LinearLayout,
            layout_width="-1";
            {
              Button,
              text=Text[24],
              layout_width="-1",
              id="button_知道了";
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

  dialog10=dialog.show()

  dialog10.getWindow().setContentView(loadlayout(AlertDialogLayout));

  dialog10.getWindow().setBackgroundDrawable(ColorDrawable(0x00000000));

  dialogWindow = dialog10.getWindow();

  dialogWindow.setGravity(Gravity.BOTTOM);
  dialog10.setCancelable(false)
  dialog10.setCanceledOnTouchOutside(false)
  dialog10.getWindow().getAttributes().width=(activity.Width);
  dialog10.getWindow().clearFlags(WindowManager.LayoutParams.FLAG_ALT_FOCUSABLE_IM);
  dialog10.getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_STATE_ALWAYS_VISIBLE);
  dialog10.getWindow().setFlags(WindowManager.LayoutParams.FLAG_ALT_FOCUSABLE_IM,WindowManager.LayoutParams.FLAG_ALT_FOCUSABLE_IM);
  radiu=30
  Shanxun.控件圆角(dc,0xffffffff,{radiu,radiu,radiu,radiu,0,radiu,0,radiu})
  radiu=360
  Shanxun.控件圆角(button_知道了,0xFF85C388,{radiu,radiu,radiu,radiu,radiu,radiu,radiu,radiu})
  text.Text=Html.fromHtml(content)
  --使TextView支持点击超链接
  text.setMovementMethod(LinkMovementMethod.getInstance())
  button_知道了.onClick=function(v)
    dialog10.dismiss()
  end
end



onRequestPermissionsResult=function(r,p,g)
end

function 创建目录_dialog()

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
        text=Text[26];
        layout_marginTop="10dp";
        layout_marginLeft="15dp";
        layout_marginRight="15dp";
        textColor="0xff000000";
        singleLine=true;
        ellipsize="end";
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
            EditText,
            layout_width="90%w",
            layout_height="60dp",
            layout_marginLeft="5%w",
            Typeface=Typeface.defaultFromStyle(Typeface.BOLD),
            id="edit_text",
          },
          {
            LinearLayout,
            layout_width="-1";
            {
              Button,
              text=Text[27],
              layout_width="-1",
              id="button_确定";
              layout_weight="1";
              layout_margin="10dp";
              textColor="0xFFFFFFFF";
              layout_height="5%h";
            };
            {
              Button,
              text=Text[28],
              layout_width="-1",
              id="button_取消";
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

  dialog3=dialog.show()

  dialog3.getWindow().setContentView(loadlayout(AlertDialogLayout));

  dialog3.getWindow().setBackgroundDrawable(ColorDrawable(0x00000000));

  dialogWindow = dialog3.getWindow();

  dialogWindow.setGravity(Gravity.BOTTOM);
  dialog3.setCancelable(false)
  dialog3.setCanceledOnTouchOutside(false)
  dialog3.getWindow().getAttributes().width=(activity.Width);
  dialog3.getWindow().clearFlags(WindowManager.LayoutParams.FLAG_ALT_FOCUSABLE_IM);
  dialog3.getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_STATE_ALWAYS_VISIBLE);
  radiu=30
  Shanxun.控件圆角(dc,0xffffffff,{radiu,radiu,radiu,radiu,0,radiu,0,radiu})
  radiu=360
  Shanxun.控件圆角(button_确定,0xFF85C388,{radiu,radiu,radiu,radiu,radiu,radiu,radiu,radiu})
  radiu=360
  Shanxun.控件圆角(button_取消,0xFF7f9eb2,{radiu,radiu,radiu,radiu,radiu,radiu,radiu,radiu})
  edit_text.setSelection(utf8.len(edit_text.Text));
  button_确定.onClick=function(v)
    if edit_text.Text=="" then
      radiu=360
      Shanxun.提示(0xFFF25D87,{radiu,radiu,radiu,radiu,radiu,radiu,radiu,radiu},Text[29])
     else
      动画加载_dialog()
      Api.diradd(url,cookie_dir,edit_text.Text,function(content)
        Api.filelist(url,cookie_dir,dir[#dir],function(content)
          列表启动(content["data"]["objects"])
          dialog2.dismiss()
          dialog3.dismiss()
          radiu=360
          Shanxun.提示(0xFF85C388,{radiu,radiu,radiu,radiu,radiu,radiu,radiu,radiu},Text[30])
        end,
        function(content)
          dialog2.dismiss()
          radiu=360
          Shanxun.提示(0xFFF25D87,{radiu,radiu,radiu,radiu,radiu,radiu,radiu,radiu},Text[31])
        end)
      end,
      function(content)
        dialog2.dismiss()
      end)
    end
  end
  button_取消.onClick=function(v)
    dialog3.dismiss()
  end
end

function 创建文件_dialog()

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
        text=Text[32];
        layout_marginTop="10dp";
        layout_marginLeft="15dp";
        layout_marginRight="15dp";
        textColor="0xff000000";
        singleLine=true;
        ellipsize="end";
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
            EditText,
            layout_width="90%w",
            layout_height="60dp",
            layout_marginLeft="5%w",
            Typeface=Typeface.defaultFromStyle(Typeface.BOLD),
            id="edit_text",
          },
          {
            LinearLayout,
            layout_width="-1";
            {
              Button,
              text=Text[27],
              layout_width="-1",
              id="button_确定";
              layout_weight="1";
              layout_margin="10dp";
              textColor="0xFFFFFFFF";
              layout_height="5%h";
            };
            {
              Button,
              text=Text[28],
              layout_width="-1",
              id="button_取消";
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

  dialog3=dialog.show()

  dialog3.getWindow().setContentView(loadlayout(AlertDialogLayout));

  dialog3.getWindow().setBackgroundDrawable(ColorDrawable(0x00000000));

  dialogWindow = dialog3.getWindow();

  dialogWindow.setGravity(Gravity.BOTTOM);
  dialog3.setCancelable(false)
  dialog3.setCanceledOnTouchOutside(false)
  dialog3.getWindow().getAttributes().width=(activity.Width);
  dialog3.getWindow().clearFlags(WindowManager.LayoutParams.FLAG_ALT_FOCUSABLE_IM);
  dialog3.getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_STATE_ALWAYS_VISIBLE);
  radiu=30
  Shanxun.控件圆角(dc,0xffffffff,{radiu,radiu,radiu,radiu,0,radiu,0,radiu})
  radiu=360
  Shanxun.控件圆角(button_确定,0xFF85C388,{radiu,radiu,radiu,radiu,radiu,radiu,radiu,radiu})
  radiu=360
  Shanxun.控件圆角(button_取消,0xFF7f9eb2,{radiu,radiu,radiu,radiu,radiu,radiu,radiu,radiu})
  edit_text.setSelection(utf8.len(edit_text.Text));
  button_确定.onClick=function(v)
    if edit_text.Text=="" then
      radiu=360
      Shanxun.提示(0xFFF25D87,{radiu,radiu,radiu,radiu,radiu,radiu,radiu,radiu},Text[33])
     else
      动画加载_dialog()
      Api.fileadd(url,cookie_dir,edit_text.Text,function(content)
        Api.filelist(url,cookie_dir,dir[#dir],function(content)
          列表启动(content["data"]["objects"])
          dialog2.dismiss()
          dialog3.dismiss()
          radiu=360
          Shanxun.提示(0xFF85C388,{radiu,radiu,radiu,radiu,radiu,radiu,radiu,radiu},Text[34])
        end,
        function(content)
          dialog2.dismiss()
          radiu=360
          Shanxun.提示(0xFFF25D87,{radiu,radiu,radiu,radiu,radiu,radiu,radiu,radiu},Text[35])
        end)
      end,
      function(content)
        dialog2.dismiss()
      end)
    end
  end
  button_取消.onClick=function(v)
    dialog3.dismiss()
  end
end
function 重名_dialog(file_name,file_id,fun)

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
        text=Text[36];
        layout_marginTop="10dp";
        layout_marginLeft="15dp";
        layout_marginRight="15dp";
        textColor="0xff000000";
        singleLine=true;
        ellipsize="end";
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
            EditText,
            layout_width="90%w",
            layout_height="60dp",
            layout_marginLeft="5%w",
            Typeface=Typeface.defaultFromStyle(Typeface.BOLD),
            id="edit_text",
            text=file_name,
          },
          {
            LinearLayout,
            layout_width="-1";
            {
              Button,
              text=Text[27],
              layout_width="-1",
              id="button_确定";
              layout_weight="1";
              layout_margin="10dp";
              textColor="0xFFFFFFFF";
              layout_height="5%h";
            };
            {
              Button,
              text=Text[28],
              layout_width="-1",
              id="button_取消";
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

  dialog3=dialog.show()

  dialog3.getWindow().setContentView(loadlayout(AlertDialogLayout));

  dialog3.getWindow().setBackgroundDrawable(ColorDrawable(0x00000000));

  dialogWindow = dialog3.getWindow();

  dialogWindow.setGravity(Gravity.BOTTOM);
  dialog3.setCancelable(false)
  dialog3.setCanceledOnTouchOutside(false)
  dialog3.getWindow().getAttributes().width=(activity.Width);
  dialog3.getWindow().clearFlags(WindowManager.LayoutParams.FLAG_ALT_FOCUSABLE_IM);
  dialog3.getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_STATE_ALWAYS_VISIBLE);
  radiu=30
  Shanxun.控件圆角(dc,0xffffffff,{radiu,radiu,radiu,radiu,0,radiu,0,radiu})
  radiu=360
  Shanxun.控件圆角(button_确定,0xFF85C388,{radiu,radiu,radiu,radiu,radiu,radiu,radiu,radiu})
  radiu=360
  Shanxun.控件圆角(button_取消,0xFF7f9eb2,{radiu,radiu,radiu,radiu,radiu,radiu,radiu,radiu})
  edit_text.setSelection(utf8.len(edit_text.Text));
  button_确定.onClick=function(v)
    if edit_text.Text=="" then
      radiu=360
      Shanxun.提示(0xFFF25D87,{radiu,radiu,radiu,radiu,radiu,radiu,radiu,radiu},Text[33])
     else
      fun(file_name,file_id)
    end
  end
  button_取消.onClick=function(v)
    dialog3.dismiss()
  end
end
function 兑换_dialog(deem_id,deem_name,deem_num)

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
        text=Text[37]..deem_name;
        layout_marginTop="10dp";
        layout_marginLeft="15dp";
        layout_marginRight="15dp";
        textColor="0xff000000";
        singleLine=true;
        ellipsize="end";
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
            text=Text[38]..deem_num;
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
              text=Text[39],
              layout_width="-1",
              id="button_兑换";
              layout_weight="1";
              layout_margin="10dp";
              textColor="0xFFFFFFFF";
              layout_height="5%h";
            };
            {
              Button,
              text=Text[28],
              layout_width="-1",
              id="button_取消";
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
  Shanxun.控件圆角(button_兑换,0xFF85C388,{radiu,radiu,radiu,radiu,radiu,radiu,radiu,radiu})
  radiu=360
  Shanxun.控件圆角(button_取消,0xFF7f9eb2,{radiu,radiu,radiu,radiu,radiu,radiu,radiu,radiu})

  text.setLineSpacing(0,1.5);

  button_兑换.onClick=function(v)
    动画加载_dialog()
    Api.rxdeem(url,cookie_dir,deem_id,function(content)
      dialog1.dismiss()
      dialog2.dismiss()
      radiu=360
      Shanxun.提示(0xFF85C388,{radiu,radiu,radiu,radiu,radiu,radiu,radiu,radiu},Text[40])
    end,
    function(content)
      dialog1.dismiss()
      dialog2.dismiss()
      radiu=360
      Shanxun.提示(0xFFF25D87,{radiu,radiu,radiu,radiu,radiu,radiu,radiu,radiu},content["msg"])
    end)
  end
  button_取消.onClick=function(v)
    dialog1.dismiss()
  end
end
function 激活码_dialog()

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
        text=Text[41];
        layout_marginTop="10dp";
        layout_marginLeft="15dp";
        layout_marginRight="15dp";
        textColor="0xff000000";
        singleLine=true;
        ellipsize="end";
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
            EditText,
            layout_width="90%w",
            layout_height="60dp",
            layout_marginLeft="5%w",
            Typeface=Typeface.defaultFromStyle(Typeface.BOLD),
            id="edit_text",
            Hint=Text[42];
          },
          {
            LinearLayout,
            layout_width="-1";
            {
              Button,
              text=Text[43],
              layout_width="-1",
              id="button_支付宝";
              layout_weight="1";
              layout_margin="10dp";
              textColor="0xFFFFFFFF";
              layout_height="5%h";
            };
            {
              Button,
              text=Text[44],
              layout_width="-1",
              id="button_下一步";
              layout_weight="1";
              layout_margin="10dp";
              textColor="0xFFFFFFFF";
              layout_height="5%h";
            };
            {
              Button,
              text=Text[28],
              layout_width="-1",
              id="button_取消";
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

  dialog3=dialog.show()

  dialog3.getWindow().setContentView(loadlayout(AlertDialogLayout));

  dialog3.getWindow().setBackgroundDrawable(ColorDrawable(0x00000000));

  dialogWindow = dialog3.getWindow();

  dialogWindow.setGravity(Gravity.BOTTOM);
  dialog3.setCancelable(false)
  dialog3.setCanceledOnTouchOutside(false)
  dialog3.getWindow().getAttributes().width=(activity.Width);
  dialog3.getWindow().clearFlags(WindowManager.LayoutParams.FLAG_ALT_FOCUSABLE_IM);
  dialog3.getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_STATE_ALWAYS_VISIBLE);
  radiu=30
  Shanxun.控件圆角(dc,0xffffffff,{radiu,radiu,radiu,radiu,0,radiu,0,radiu})
  radiu=360
  Shanxun.控件圆角(button_下一步,0xFF85C388,{radiu,radiu,radiu,radiu,radiu,radiu,radiu,radiu})
  radiu=360
  Shanxun.控件圆角(button_取消,0xFF7f9eb2,{radiu,radiu,radiu,radiu,radiu,radiu,radiu,radiu})
  radiu=360
  Shanxun.控件圆角(button_支付宝,0xFFff7473,{radiu,radiu,radiu,radiu,radiu,radiu,radiu,radiu})

  edit_text.setSelection(utf8.len(edit_text.Text));
  button_支付宝.onClick=function(v)
    import "android.content.Intent"
    import "android.content.pm.PackageManager"
    activity.startActivity(Intent.parseUri("alipays://platformapi/startapp?saId=10000007&clientVersion=3.7.0.0718&qrcode=https%3A%2F%2Fqr.alipay.com%2F00c15509bgmaxmlgciobo02%3F_s%3Dweb-other", Intent.URI_INTENT_SCHEME))
  end
  button_下一步.onClick=function(v)
    if edit_text.Text=="" then
      radiu=360
      Shanxun.提示(0xFFF25D87,{radiu,radiu,radiu,radiu,radiu,radiu,radiu,radiu},Text[45])
     else
      动画加载_dialog()
      Api.redeem(url,cookie_dir,edit_text.Text,function(content)
        dialog3.dismiss()
        dialog2.dismiss()
        兑换_dialog(edit_text.Text,content["data"]["name"],content["data"]["num"])
      end,
      function(content)
        dialog2.dismiss()
        edit_text.setText("")
        radiu=360
        Shanxun.提示(0xFFF25D87,{radiu,radiu,radiu,radiu,radiu,radiu,radiu,radiu},content["msg"])
      end)
    end
  end
  button_取消.onClick=function(v)
    dialog3.dismiss()
  end
end

function 分享_dialog(file_id,dirs,fun)
  if dirs then
    Code=Text[46]
   else
    Code=Text[47]
  end
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
        text=Text[48]..Code..Text[49];
        layout_marginTop="10dp";
        layout_marginLeft="15dp";
        layout_marginRight="15dp";
        textColor="0xff000000";
        singleLine=true;
        ellipsize="end";
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
            LinearLayout;
            layout_margin="10dp";
            layout_width="-1";
            orientation="vertical";
            layout_height="-1";
            {
              LinearLayout;
              layout_margin="1%w";
              layout_width="-1";
              {
                TextView;
                text=Code..Text[50];
                layout_weight="1";
                textSize="12sp";
                Typeface=Typeface.createFromFile(File(activity.getLuaDir()..'/TTF/a.ttf'));
              };
              {
                Switch;
                id="文件预览";
              };
            };
            {
              LinearLayout;
              layout_margin="1%w";
              layout_width="-1";
              {
                TextView;
                textSize="12sp";
                text=Text[51];
                Typeface=Typeface.createFromFile(File(activity.getLuaDir()..'/TTF/a.ttf'));
              };
              {
                EditText;
                Hint=Text[52];
                layout_weight="1";
                textSize="12sp";
                id="密码";
                MaxEms=6;
                singleLine=true;
                Typeface=Typeface.createFromFile(File(activity.getLuaDir()..'/TTF/a.ttf'));
              };
            };
            {
              LinearLayout;
              layout_margin="1%w";
              layout_width="-1";
              {
                TextView;
                textSize="12sp";
                text=Text[53];
                Typeface=Typeface.createFromFile(File(activity.getLuaDir()..'/TTF/a.ttf'));
              };
              {
                EditText;
                Hint=Text[54];
                layout_weight="1";
                textSize="12sp";
                id="下载次数";
                MaxEms=10000;
                singleLine=true;
                Typeface=Typeface.createFromFile(File(activity.getLuaDir()..'/TTF/a.ttf'));
              };
              {
                TextView;
                textSize="12sp";
                text=Text[55];
                Typeface=Typeface.createFromFile(File(activity.getLuaDir()..'/TTF/a.ttf'));
              };
            };
            {
              LinearLayout;
              layout_margin="1%w";
              layout_width="-1";
              {
                TextView;
                textSize="12sp";
                text=Text[56];
                Typeface=Typeface.createFromFile(File(activity.getLuaDir()..'/TTF/a.ttf'));
              };
              {
                EditText;
                Hint=Text[57];
                layout_weight="1";
                textSize="12sp";
                id="下载限时";
                MaxEms=1000;
                singleLine=true;
                Typeface=Typeface.createFromFile(File(activity.getLuaDir()..'/TTF/a.ttf'));
              };
              {
                TextView;
                textSize="12sp";
                text=Text[58];
                Typeface=Typeface.createFromFile(File(activity.getLuaDir()..'/TTF/a.ttf'));
              };
            };
            {
              LinearLayout;
              layout_margin="1%w";
              layout_width="-1";
              {
                TextView;
                text=Text[59];
                textSize="12sp";
                Typeface=Typeface.createFromFile(File(activity.getLuaDir()..'/TTF/a.ttf'));
              };
              {
                EditText;
                Hint=Text[60];
                layout_weight="1";
                textSize="12sp";
                id="积分";
                MaxEms=1000000;
                singleLine=true;
                Typeface=Typeface.createFromFile(File(activity.getLuaDir()..'/TTF/a.ttf'));
              };
              {
                TextView;
                textSize="12sp";
                text=Text[61];
                Typeface=Typeface.createFromFile(File(activity.getLuaDir()..'/TTF/a.ttf'));
              };
            };
          };
          {
            LinearLayout,
            layout_width="-1";
            {
              Button,
              text=Text[62],
              layout_width="-1",
              id="button_创建";
              layout_weight="1";
              layout_margin="10dp";
              textColor="0xFFFFFFFF";
              layout_height="5%h";
            };
            {
              Button,
              text=Text[28],
              layout_width="-1",
              id="button_取消";
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

  dialog3=dialog.show()

  dialog3.getWindow().setContentView(loadlayout(AlertDialogLayout));

  dialog3.getWindow().setBackgroundDrawable(ColorDrawable(0x00000000));

  dialogWindow = dialog3.getWindow();

  dialogWindow.setGravity(Gravity.BOTTOM);
  dialog3.setCancelable(false)
  dialog3.setCanceledOnTouchOutside(false)
  dialog3.getWindow().getAttributes().width=(activity.Width);
  dialog3.getWindow().clearFlags(WindowManager.LayoutParams.FLAG_ALT_FOCUSABLE_IM);
  dialog3.getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_STATE_ALWAYS_VISIBLE);
  radiu=30
  Shanxun.控件圆角(dc,0xffffffff,{radiu,radiu,radiu,radiu,0,radiu,0,radiu})
  radiu=360
  Shanxun.控件圆角(button_创建,0xFF85C388,{radiu,radiu,radiu,radiu,radiu,radiu,radiu,radiu})
  radiu=360
  Shanxun.控件圆角(button_取消,0xFF7f9eb2,{radiu,radiu,radiu,radiu,radiu,radiu,radiu,radiu})

  import "android.text.InputType"
  import "android.text.method.DigitsKeyListener"

  密码.setInputType(InputType.TYPE_CLASS_NUMBER)
  密码.setKeyListener(DigitsKeyListener.getInstance("0123456789qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM"))

  下载次数.setInputType(InputType.TYPE_CLASS_NUMBER)
  下载次数.setKeyListener(DigitsKeyListener.getInstance("0123456789"))

  下载限时.setInputType(InputType.TYPE_CLASS_NUMBER)
  下载限时.setKeyListener(DigitsKeyListener.getInstance("0123456789"))

  积分.setInputType(InputType.TYPE_CLASS_NUMBER)
  积分.setKeyListener(DigitsKeyListener.getInstance("0123456789"))

  button_创建.onClick=function(v)
    if not(密码.Text==nil) then
      pw=密码.Text
     else
      pw=""
    end
    if not(下载次数.Text=="") then
      ds=tonumber(下载次数.Text)
     else
      ds=-1
    end
    if not(下载限时.Text=="") then
      dx=tonumber(下载限时.Text)*60
     else
      dx=86400
    end
    if not(积分.Text=="") then
      df=tonumber(积分.Text)
     else
      df=0
    end
    
    file_id,dirs,pw,ds,dx,df,文件预览.checked)
  end
  button_取消.onClick=function(v)
    dialog3.dismiss()
  end
end

function 操作_dialog(file_name,file_id)

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
        text=Text[63]..file_name;
        layout_marginTop="10dp";
        layout_marginLeft="15dp";
        layout_marginRight="15dp";
        textColor="0xff000000";
        singleLine=true;
        ellipsize="end";
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
            text=Text[64];
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
              text=Text[72],
              layout_width="-1",
              id="button_编辑";
              layout_weight="1";
              layout_margin="10dp";
              textColor="0xFFFFFFFF";
              layout_height="5%h";
            };
            {
              Button,
              text=Text[66],
              layout_width="-1",
              id="button_分享";
              layout_weight="1";
              layout_margin="10dp";
              textColor="0xFFFFFFFF";
              layout_height="5%h";
            };
            {
              Button,
              text=Text[67],
              layout_width="-1",
              id="button_下载";
              layout_weight="1";
              layout_margin="10dp";
              textColor="0xFFFFFFFF";
              layout_height="5%h";
            };
            {
              Button,
              text=Text[28],
              layout_width="-1",
              id="button_取消";
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
  Shanxun.控件圆角(button_分享,0xFF85C388,{radiu,radiu,radiu,radiu,radiu,radiu,radiu,radiu})
  radiu=360
  Shanxun.控件圆角(button_编辑,0xFF47b8e0,{radiu,radiu,radiu,radiu,radiu,radiu,radiu,radiu})
  radiu=360
  Shanxun.控件圆角(button_下载,0xFFffc952,{radiu,radiu,radiu,radiu,radiu,radiu,radiu,radiu})
  radiu=360
  Shanxun.控件圆角(button_取消,0xFF7f9eb2,{radiu,radiu,radiu,radiu,radiu,radiu,radiu,radiu})

  text.setLineSpacing(0,1.5);
  button_分享.onClick=function(v)
    dialog1.dismiss()
    分享_dialog(file_id,false,function(file_id,dirs,pw,ds,dx,df,dy)
      动画加载_dialog()
      Api.share(url,cookie_dir,file_id,dirs,pw,ds,dx,df,dy,function(content)
        dialog3.dismiss()
        dialog2.dismiss()
        import "android.content.Intent"
        import "android.net.Uri"
        viewIntent = Intent("android.intent.action.VIEW",Uri.parse(content["data"]))
        activity.startActivity(viewIntent)
      end,
      function(content)
        dialog2.dismiss()
      end)
    end)
  end
  function getExtension(str)
    return str:match(".+%.(%w+)$")
  end
  function Table_exists(tables,value)
    for index,content in pairs(tables) do
      if content:find(value) then
        return true
      end
    end
    return false
  end

  file_k=["png","jpg","jpeg"]
  if Table_exists(file_k,getExtension(file_name))
    button_编辑.setText(Text[73])
   else
    file_k=["php","go","java","c","html","js","lua","txt","py","css","js","bat","cpp","xml","json","sql","ini"]
    if Table_exists(file_k,getExtension(file_name))
     else
      button_编辑.setVisibility(View.GONE)
    end
  end
  button_编辑.onClick=function(v)
    dialog1.dismiss()
    function getExtension(str)
      return str:match(".+%.(%w+)$")
    end
    function Table_exists(tables,value)
      for index,content in pairs(tables) do
        if content:find(value) then
          return true
        end
      end
      return false
    end
    file_k=["png","jpg","jpeg"]
    if Table_exists(file_k,getExtension(file_name))
      activity.newActivity("preview",android.R.anim.fade_in,android.R.anim.fade_out,{file_name,file_id})
     else
      file_k=["php","go","java","c","html","js","lua","txt","py","css","js","bat","cpp","xml","json","sql","ini"]
      if Table_exists(file_k,getExtension(file_name))
        activity.newActivity("editor",android.R.anim.fade_in,android.R.anim.fade_out,{file_name,file_id})
       else
        radiu=360
        Shanxun.提示(0xFFF25D87,{radiu,radiu,radiu,radiu,radiu,radiu,radiu,radiu},"暂时不支持编辑")
      end
    end
  end
  button_下载.onClick=function(v)
    Api.download(url,cookie_dir,file_id,function(content)
      dialog1.dismiss()
      import "android.content.Intent"
      import "android.net.Uri"
      viewIntent = Intent("android.intent.action.VIEW",Uri.parse(content["data"]))
      activity.startActivity(viewIntent)
    end,
    function(content)
    end)
  end
  button_取消.onClick=function(v)
    dialog1.dismiss()
  end
end
function 文件操作_dialog(file_name,file_id)
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
        text=Text[63]..file_name;
        layout_marginTop="10dp";
        layout_marginLeft="15dp";
        layout_marginRight="15dp";
        textColor="0xff000000";
        singleLine=true;
        ellipsize="end";
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
            text=Text[69];
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
              text=Text[65],
              layout_width="-1",
              id="button_删除";
              layout_weight="1";
              layout_margin="10dp";
              textColor="0xFFFFFFFF";
              layout_height="5%h";
            };
            {
              Button,
              text=Text[70],
              layout_width="-1",
              id="button_复制";
              layout_weight="1";
              layout_margin="10dp";
              textColor="0xFFFFFFFF";
              layout_height="5%h";
            };
            {
              Button,
              text=Text[71],
              layout_width="-1",
              id="button_移动";
              layout_weight="1";
              layout_margin="10dp";
              textColor="0xFFFFFFFF";
              layout_height="5%h";
            };
            {
              Button,
              text=Text[28],
              layout_width="-1",
              id="button_取消";
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
  Shanxun.控件圆角(button_移动,0xFFffc952,{radiu,radiu,radiu,radiu,radiu,radiu,radiu,radiu})
  radiu=360
  Shanxun.控件圆角(button_复制,0xff8080FF,{radiu,radiu,radiu,radiu,radiu,radiu,radiu,radiu})
  radiu=360
  Shanxun.控件圆角(button_删除,0xFFF25D87,{radiu,radiu,radiu,radiu,radiu,radiu,radiu,radiu})
  radiu=360
  Shanxun.控件圆角(button_取消,0xFF7f9eb2,{radiu,radiu,radiu,radiu,radiu,radiu,radiu,radiu})



  text.setLineSpacing(0,1.5);
  button_移动.onClick=function(v)
    copy_dir=dir[#dir]
    copy_dirs=false
    copy_file_id=file_id
    copy_file_name=file_name
    type_操作="move"
    功能图片.setImageBitmap(loadbitmap(activity.getLuaDir().."/src/m.png"))
    dialog1.dismiss()
    import "android.view.animation.Animation"
    import "android.view.animation.AlphaAnimation"
    import "android.view.animation.AnimationSet"
    import "android.view.animation.*"
    import "android.animation.ObjectAnimator"
    import "android.animation.ArgbEvaluator"
    import "android.animation.ValueAnimator"
    import "android.graphics.Color"
    color1 = 0xFFF25D87;
    color2 = 0xFFffc952;
    colorAnim = ObjectAnimator.ofInt(功能按钮,"backgroundColor",{color1, color2})
    colorAnim.setDuration(1000)--颜色变换间歇
    colorAnim.setEvaluator(ArgbEvaluator())
    colorAnim.setRepeatCount(0)
    colorAnim.setRepeatMode(ValueAnimator.REVERSE)
    colorAnim.start()
  end
button_删除.onClick=function(v)
    动画加载_dialog()
    Api.delfile(url,cookie_dir,file_id,nil,function(content)
      Api.filelist(url,cookie_dir,dir[#dir],function(content)
        列表启动(content["data"]["objects"])
        dialog2.dismiss()
      end,
      function(content)
        dialog2.dismiss()
      end)
      dialog1.dismiss()
      radiu=360
      Shanxun.提示(0xFF85C388,{radiu,radiu,radiu,radiu,radiu,radiu,radiu,radiu},Text[68])
    end,
    function(content)
      dialog2.dismiss()
    end)
  end
  button_复制.onClick=function(v)
    copy_dir=dir[#dir]
    copy_dirs=false
    copy_file_id=file_id
    copy_file_name=file_name
    type_操作="copy"
    功能图片.setImageBitmap(loadbitmap(activity.getLuaDir().."/src/c.png"))
    dialog1.dismiss()
    import "android.view.animation.Animation"
    import "android.view.animation.AlphaAnimation"
    import "android.view.animation.AnimationSet"
    import "android.view.animation.*"
    import "android.animation.ObjectAnimator"
    import "android.animation.ArgbEvaluator"
    import "android.animation.ValueAnimator"
    import "android.graphics.Color"
    color1 = 0xFFF25D87;
    color2 = 0xff8080FF;
    colorAnim = ObjectAnimator.ofInt(功能按钮,"backgroundColor",{color1, color2})
    colorAnim.setDuration(1000)--颜色变换间歇
    colorAnim.setEvaluator(ArgbEvaluator())
    colorAnim.setRepeatCount(0)
    colorAnim.setRepeatMode(ValueAnimator.REVERSE)
    colorAnim.start()
  end

  button_取消.onClick=function(v)
    dialog1.dismiss()
  end
end
function 复制_dialog()
  if copy_dir=="/" then
    file_title="/"..copy_file_name.." 复制到: "..dir[#dir]
   else
    file_title=copy_dir.."/"..copy_file_name.." 复制到: "..dir[#dir]
  end
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
        text=file_title ;
        layout_marginTop="10dp";
        layout_marginLeft="15dp";
        layout_marginRight="15dp";
        textColor="0xff000000";
        singleLine=true;
        ellipsize="end";
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
            LinearLayout,
            layout_width="-1";
            {
              Button,
              text="确定",
              layout_width="-1",
              id="button_确定";
              layout_weight="1";
              layout_margin="10dp";
              textColor="0xFFFFFFFF";
              layout_height="5%h";
            };
            {
              Button,
              text="取消",
              layout_width="-1",
              id="button_取消";
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

  dialog3=dialog.show()

  dialog3.getWindow().setContentView(loadlayout(AlertDialogLayout));

  dialog3.getWindow().setBackgroundDrawable(ColorDrawable(0x00000000));

  dialogWindow = dialog3.getWindow();

  dialogWindow.setGravity(Gravity.BOTTOM);
  dialog3.setCancelable(false)
  dialog3.setCanceledOnTouchOutside(false)
  dialog3.getWindow().getAttributes().width=(activity.Width);
  dialog3.getWindow().clearFlags(WindowManager.LayoutParams.FLAG_ALT_FOCUSABLE_IM);
  dialog3.getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_STATE_ALWAYS_VISIBLE);
  dialog3.getWindow().setFlags(WindowManager.LayoutParams.FLAG_ALT_FOCUSABLE_IM,WindowManager.LayoutParams.FLAG_ALT_FOCUSABLE_IM);
  radiu=30
  Shanxun.控件圆角(dc,0xffffffff,{radiu,radiu,radiu,radiu,0,radiu,0,radiu})
  radiu=360
  Shanxun.控件圆角(button_确定,0xFF85C388,{radiu,radiu,radiu,radiu,radiu,radiu,radiu,radiu})
  radiu=360
  Shanxun.控件圆角(button_取消,0xFF7f9eb2,{radiu,radiu,radiu,radiu,radiu,radiu,radiu,radiu})
  button_确定.onClick=function(v)
    动画加载_dialog()
    Api.filecopy(url,cookie_dir,copy_dirs,copy_dir,nil,copy_file_id,dir[#dir],function(content)
      dialog3.dismiss()
      Api.filelist(url,cookie_dir,dir[#dir],function(content)
        列表启动(content["data"]["objects"])
        dialog2.dismiss()
      end,
      function(content)
        dialog2.dismiss()
      end)
      type_操作=false
      功能图片.setImageBitmap(loadbitmap(activity.getLuaDir().."/src/j.png"))
      import "android.view.animation.Animation"
      import "android.view.animation.AlphaAnimation"
      import "android.view.animation.AnimationSet"
      import "android.view.animation.*"
      import "android.animation.ObjectAnimator"
      import "android.animation.ArgbEvaluator"
      import "android.animation.ValueAnimator"
      import "android.graphics.Color"
      color2 = 0xFFF25D87;
      color1 = 0xff8080FF;
      colorAnim = ObjectAnimator.ofInt(功能按钮,"backgroundColor",{color1, color2})
      colorAnim.setDuration(1000)--颜色变换间歇
      colorAnim.setEvaluator(ArgbEvaluator())
      colorAnim.setRepeatCount(0)
      colorAnim.setRepeatMode(ValueAnimator.REVERSE)
      colorAnim.start()
      radiu=360
      Shanxun.提示(0xFF85C388,{radiu,radiu,radiu,radiu,radiu,radiu,radiu,radiu},"复制成功")
    end,
    function(content)
      dialog2.dismiss()
      radiu=360
      Shanxun.提示(0xFFF25D87,{radiu,radiu,radiu,radiu,radiu,radiu,radiu,radiu},content["msg"])
    end)
  end
  button_取消.onClick=function(v)
    dialog3.dismiss()
  end
end
function 移动_dialog()
  if copy_dir=="/" then
    file_title="/"..copy_file_name.." 移动到: "..dir[#dir]
   else
    file_title=copy_dir.."/"..copy_file_name.." 移动到: "..dir[#dir]
  end
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
        text=file_title ;
        layout_marginTop="10dp";
        layout_marginLeft="15dp";
        layout_marginRight="15dp";
        textColor="0xff000000";
        singleLine=true;
        ellipsize="end";
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
            LinearLayout,
            layout_width="-1";
            {
              Button,
              text="确定",
              layout_width="-1",
              id="button_确定";
              layout_weight="1";
              layout_margin="10dp";
              textColor="0xFFFFFFFF";
              layout_height="5%h";
            };
            {
              Button,
              text="取消",
              layout_width="-1",
              id="button_取消";
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

  dialog3=dialog.show()

  dialog3.getWindow().setContentView(loadlayout(AlertDialogLayout));

  dialog3.getWindow().setBackgroundDrawable(ColorDrawable(0x00000000));

  dialogWindow = dialog3.getWindow();

  dialogWindow.setGravity(Gravity.BOTTOM);
  dialog3.setCancelable(false)
  dialog3.setCanceledOnTouchOutside(false)
  dialog3.getWindow().getAttributes().width=(activity.Width);
  dialog3.getWindow().clearFlags(WindowManager.LayoutParams.FLAG_ALT_FOCUSABLE_IM);
  dialog3.getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_STATE_ALWAYS_VISIBLE);
  dialog3.getWindow().setFlags(WindowManager.LayoutParams.FLAG_ALT_FOCUSABLE_IM,WindowManager.LayoutParams.FLAG_ALT_FOCUSABLE_IM);
  radiu=30
  Shanxun.控件圆角(dc,0xffffffff,{radiu,radiu,radiu,radiu,0,radiu,0,radiu})
  radiu=360
  Shanxun.控件圆角(button_确定,0xFF85C388,{radiu,radiu,radiu,radiu,radiu,radiu,radiu,radiu})
  radiu=360
  Shanxun.控件圆角(button_取消,0xFF7f9eb2,{radiu,radiu,radiu,radiu,radiu,radiu,radiu,radiu})
  button_确定.onClick=function(v)
    动画加载_dialog()
    Api.filemove(url,cookie_dir,copy_dirs,copy_dir,nil,copy_file_id,dir[#dir],function(content)
      dialog3.dismiss()
      Api.filelist(url,cookie_dir,dir[#dir],function(content)
        列表启动(content["data"]["objects"])
        dialog2.dismiss()
      end,
      function(content)
        dialog2.dismiss()
      end)
      type_操作=false
      功能图片.setImageBitmap(loadbitmap(activity.getLuaDir().."/src/j.png"))
      import "android.view.animation.Animation"
      import "android.view.animation.AlphaAnimation"
      import "android.view.animation.AnimationSet"
      import "android.view.animation.*"
      import "android.animation.ObjectAnimator"
      import "android.animation.ArgbEvaluator"
      import "android.animation.ValueAnimator"
      import "android.graphics.Color"
      color2 = 0xFFF25D87;
      color1 = 0xFF85C388;
      colorAnim = ObjectAnimator.ofInt(功能按钮,"backgroundColor",{color1, color2})
      colorAnim.setDuration(1000)--颜色变换间歇
      colorAnim.setEvaluator(ArgbEvaluator())
      colorAnim.setRepeatCount(0)
      colorAnim.setRepeatMode(ValueAnimator.REVERSE)
      colorAnim.start()
      radiu=360
      Shanxun.提示(0xFF85C388,{radiu,radiu,radiu,radiu,radiu,radiu,radiu,radiu},"移动成功")
    end,
    function(content)
      dialog2.dismiss()
      radiu=360
      Shanxun.提示(0xFFF25D87,{radiu,radiu,radiu,radiu,radiu,radiu,radiu,radiu},content["msg"])
    end)
  end
  button_取消.onClick=function(v)
    dialog3.dismiss()
  end
end
function 文件夹操作_dialog(dir_name,dir_id)

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
        text="文件夹操作："..dir_name;
        layout_marginTop="10dp";
        layout_marginLeft="15dp";
        layout_marginRight="15dp";
        textColor="0xff000000";
        singleLine=true;
        ellipsize="end";
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
            text=[==[
--删除文件夹以及子文件不逆转请谨慎操作！

--分享文件有助于好友下载。

--重命名文件夹。
]==];
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
              text="删除",
              layout_width="-1",
              id="button_删除";
              layout_weight="1";
              layout_margin="10dp";
              textColor="0xFFFFFFFF";
              layout_height="5%h";
            };
            {
              Button,
              text="分享",
              layout_width="-1",
              id="button_分享";
              layout_weight="1";
              layout_margin="10dp";
              textColor="0xFFFFFFFF";
              layout_height="5%h";
            };
            {
              Button,
              text="重名",
              layout_width="-1",
              id="button_重名";
              layout_weight="1";
              layout_margin="10dp";
              textColor="0xFFFFFFFF";
              layout_height="5%h";
            };
            {
              Button,
              text="取消",
              layout_width="-1",
              id="button_取消";
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

  dialog4=dialog.show()

  dialog4.getWindow().setContentView(loadlayout(AlertDialogLayout));

  dialog4.getWindow().setBackgroundDrawable(ColorDrawable(0x00000000));

  dialogWindow = dialog4.getWindow();

  dialogWindow.setGravity(Gravity.BOTTOM);
  dialog4.setCancelable(false)
  dialog4.setCanceledOnTouchOutside(false)
  dialog4.getWindow().getAttributes().width=(activity.Width);
  dialog4.getWindow().clearFlags(WindowManager.LayoutParams.FLAG_ALT_FOCUSABLE_IM);
  dialog4.getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_STATE_ALWAYS_VISIBLE);
  dialog4.getWindow().setFlags(WindowManager.LayoutParams.FLAG_ALT_FOCUSABLE_IM,WindowManager.LayoutParams.FLAG_ALT_FOCUSABLE_IM);
  radiu=30
  Shanxun.控件圆角(dc,0xffffffff,{radiu,radiu,radiu,radiu,0,radiu,0,radiu})
  radiu=360
  Shanxun.控件圆角(button_分享,0xFF85C388,{radiu,radiu,radiu,radiu,radiu,radiu,radiu,radiu})
  radiu=360
  Shanxun.控件圆角(button_删除,0xFFF25D87,{radiu,radiu,radiu,radiu,radiu,radiu,radiu,radiu})
  radiu=360
  Shanxun.控件圆角(button_重名,0xFFefdc05,{radiu,radiu,radiu,radiu,radiu,radiu,radiu,radiu})
  radiu=360
  Shanxun.控件圆角(button_取消,0xFF7f9eb2,{radiu,radiu,radiu,radiu,radiu,radiu,radiu,radiu})

  text.setLineSpacing(0,1.5);
  button_分享.onClick=function(v)
    dialog4.dismiss()
    分享_dialog(dir_id,true,function(file_id,dirs,pw,ds,dx,df,dy)
      动画加载_dialog()
      Api.share(url,cookie_dir,file_id,dirs,pw,ds,dx,df,dy,function(content)
        dialog3.dismiss()
        dialog2.dismiss()
        import "android.content.Intent"
        import "android.net.Uri"
        viewIntent = Intent("android.intent.action.VIEW",Uri.parse(content["data"]))
        activity.startActivity(viewIntent)
      end,
      function(content)
        dialog2.dismiss()
      end)
    end)
  end
  button_删除.onClick=function(v)
    动画加载_dialog()
    Api.delfile(url,cookie_dir,nil,dir_id,function(content)
      Api.filelist(url,cookie_dir,dir[#dir],function(content)
        列表启动(content["data"]["objects"])
        dialog2.dismiss()
      end,
      function(content)
        dialog2.dismiss()
      end)
      dialog4.dismiss()
      radiu=360
      Shanxun.提示(0xFF85C388,{radiu,radiu,radiu,radiu,radiu,radiu,radiu,radiu},"删除文件成功")
    end,
    function(content)
      dialog2.dismiss()
    end)
  end
  button_重名.onClick=function(v)
    dialog4.dismiss()
    重名_dialog(dir_name,dir_id,function(file_name,file_id)
      动画加载_dialog()
      Api.rename(url,cookie_dir,nil,file_id,tostring(edit_text.Text),function(content)
        Api.filelist(url,cookie_dir,dir[#dir],function(content)
          列表启动(content["data"]["objects"])
          dialog2.dismiss()
        end,
        function(content)
          dialog2.dismiss()
        end)
        dialog3.dismiss()
        radiu=360
        Shanxun.提示(0xFF85C388,{radiu,radiu,radiu,radiu,radiu,radiu,radiu,radiu},"重命名成功")
      end,
      function(content)
        dialog2.dismiss()
        radiu=360
        Shanxun.提示(0xFFF25D87,{radiu,radiu,radiu,radiu,radiu,radiu,radiu,radiu},"重命名失败")
      end)
    end)
  end
  button_取消.onClick=function(v)
    dialog4.dismiss()
  end
end

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
function 动画加载_dialog关闭(aaaaa)
  task(500,function()
    dialog2.dismiss()
    swipeRefreshLayout.setRefreshing(false)
  end)
end
function blur( context, bitmap, blurRadius)
  renderScript = RenderScript.create(context);
  blurScript = ScriptIntrinsicBlur.create(renderScript, Element.U8_4(renderScript));
  inAllocation = Allocation.createFromBitmap(renderScript, bitmap);
  outputBitmap = bitmap;
  outAllocation = Allocation.createTyped(renderScript, inAllocation.getType());
  blurScript.setRadius(blurRadius);
  blurScript.setInput(inAllocation);
  blurScript.forEach(outAllocation);
  outAllocation.copyTo(outputBitmap);
  inAllocation.destroy();
  outAllocation.destroy();
  renderScript.destroy();
  blurScript.destroy();
  return outputBitmap;
end
--Gaussian = blur(activity,bitmap,25) --模糊度 0 ~ 25
--imageView.setImageBitmap(Gaussian)

--高斯模糊加深
function blurAndZoom(context,bitmap,blurRadius,scale)
  return zoomBitmap(blur(context,zoomBitmap(bitmap, 1 / scale), blurRadius), scale);
end

function zoomBitmap(bitmap,scale)
  w = bitmap.getWidth();
  h = bitmap.getHeight();
  matrix = Matrix();
  matrix.postScale(scale, scale);
  bitmap = Bitmap.createBitmap(bitmap, 0, 0, w, h, matrix, true);
  return bitmap;
end
function loadThumbnailImg(id,ImgUrl)
  Glide.with(activity)
  .asBitmap()
  .load(ImgUrl)
  .placeholder(ColorDrawable(0x6666666))
  .diskCacheStrategy(DiskCacheStrategy.NONE)--不缓存到SDCard中
  .skipMemoryCache(true)--进行内存缓存
  .into(id);

end

radiu=360
Shanxun.控件圆角(头像框,0xffffffff,{radiu,radiu,radiu,radiu,radiu,radiu,radiu,radiu})

import "android.graphics.*"
弧度控件贝塞尔=LuaDrawable(function(mCanvas,mPaint,mDrawable)
  --画笔属性
  mPaint.setColor(0xFFEEF1F6)
  mPaint.setAntiAlias(true)
  mPaint.setStrokeWidth(20)
  mPaint.setStyle(Paint.Style.FILL)
  mPaint.setStrokeCap(Paint.Cap.ROUND)
  --获取控件宽和高
  w=mDrawable.getBounds().right
  h=mDrawable.getBounds().bottom
  --路径
  path=Path()
  path.moveTo(0, 0)
  path.quadTo(w/2,h,w,0)
  path.quadTo(w,h,w,h)
  path.quadTo(0,h,0,h)
  --画布背景透明
  mCanvas.drawColor(0x00ffffff)
  mCanvas.drawPath(path, mPaint);
end)
个人弧度.background=弧度控件贝塞尔

功能判断=false
type_操作=false
功能遮罩.setVisibility(View.GONE)
文件功能按钮.setVisibility(View.GONE)
目录功能按钮.setVisibility(View.GONE)

import "android.content.Context"
function 功能遮罩.onClick()

  if 功能判断 then
    功能遮罩.setVisibility(View.GONE)
    文件功能按钮.setVisibility(View.GONE)
    目录功能按钮.setVisibility(View.GONE)
    功能判断=false

    import "android.view.animation.Animation"
    import "android.view.animation.AlphaAnimation"
    import "android.view.animation.AnimationSet"
    import "android.view.animation.*"
    animationSet= AnimationSet(true); --动画集合
    alpha=AlphaAnimation(1,0)--透明动画
    alpha.setDuration(1000); --动画时长
    alpha.setRepeatCount(0); --重复次数
    alpha.setRepeatMode(Animation.RESTART); --是否反向动画
    animationSet.addAnimation(alpha);
    功能遮罩.startAnimation(alpha);

    animationSet= AnimationSet(true); --动画集合
    alpha=AlphaAnimation(1,0)--透明动画
    alpha.setDuration(800); --动画时长
    alpha.setRepeatCount(0); --重复次数
    alpha.setRepeatMode(Animation.RESTART); --是否反向动画
    animationSet.addAnimation(alpha);
    文件功能按钮.startAnimation(alpha);

    animationSet= AnimationSet(true); --动画集合
    alpha=AlphaAnimation(1,0)--透明动画
    alpha.setDuration(500); --动画时长
    alpha.setRepeatCount(0); --重复次数
    alpha.setRepeatMode(Animation.RESTART); --是否反向动画
    animationSet.addAnimation(alpha);
    目录功能按钮.startAnimation(alpha);


    功能图片.setImageBitmap(loadbitmap(activity.getLuaDir().."/src/j.png"))

    animationSet= AnimationSet(true); --动画集合
    rotate=RotateAnimation(45, 0,
    Animation.RELATIVE_TO_SELF, 0.5,
    Animation.RELATIVE_TO_SELF, 0.5)--旋转动画
    rotate.setDuration(500); --动画时长
    rotate.setRepeatCount(0); --重复次数
    rotate.setRepeatMode(Animation.RESTART); --是否反向动画
    animationSet.addAnimation(rotate);
    功能按钮.startAnimation(rotate);
  end
end
function 功能按钮.onClick()
  if type_操作=="copy" then
    if copy_dir==dir[#dir] then
      type_操作=false
      功能图片.setImageBitmap(loadbitmap(activity.getLuaDir().."/src/j.png"))
      import "android.view.animation.Animation"
      import "android.view.animation.AlphaAnimation"
      import "android.view.animation.AnimationSet"
      import "android.view.animation.*"
      import "android.animation.ObjectAnimator"
      import "android.animation.ArgbEvaluator"
      import "android.animation.ValueAnimator"
      import "android.graphics.Color"
      color2 = 0xFFF25D87;
      color1 = 0xff8080FF;
      colorAnim = ObjectAnimator.ofInt(功能按钮,"backgroundColor",{color1, color2})
      colorAnim.setDuration(1000)--颜色变换间歇
      colorAnim.setEvaluator(ArgbEvaluator())
      colorAnim.setRepeatCount(0)
      colorAnim.setRepeatMode(ValueAnimator.REVERSE)
      colorAnim.start()
      radiu=360
      Shanxun.提示(0xFFF25D87,{radiu,radiu,radiu,radiu,radiu,radiu,radiu,radiu},"不能复制到当前目录")
     else
      复制_dialog()
    end
   elseif type_操作=="move" then
    if copy_dir==dir[#dir] then
      type_操作=false
      功能图片.setImageBitmap(loadbitmap(activity.getLuaDir().."/src/j.png"))
      import "android.view.animation.Animation"
      import "android.view.animation.AlphaAnimation"
      import "android.view.animation.AnimationSet"
      import "android.view.animation.*"
      import "android.animation.ObjectAnimator"
      import "android.animation.ArgbEvaluator"
      import "android.animation.ValueAnimator"
      import "android.graphics.Color"
      color2 = 0xFFF25D87;
      color1 = 0xFF85C388;
      colorAnim = ObjectAnimator.ofInt(功能按钮,"backgroundColor",{color1, color2})
      colorAnim.setDuration(1000)--颜色变换间歇
      colorAnim.setEvaluator(ArgbEvaluator())
      colorAnim.setRepeatCount(0)
      colorAnim.setRepeatMode(ValueAnimator.REVERSE)
      colorAnim.start()
      radiu=360
      Shanxun.提示(0xFFF25D87,{radiu,radiu,radiu,radiu,radiu,radiu,radiu,radiu},"不能移动到当前目录")
     else
      移动_dialog()
    end
   else
    if 功能判断 then
      功能遮罩.setVisibility(View.GONE)
      文件功能按钮.setVisibility(View.GONE)
      目录功能按钮.setVisibility(View.GONE)
      功能判断=false

      import "android.view.animation.Animation"
      import "android.view.animation.AlphaAnimation"
      import "android.view.animation.AnimationSet"
      import "android.view.animation.*"
      animationSet= AnimationSet(true); --动画集合
      alpha=AlphaAnimation(1,0)--透明动画
      alpha.setDuration(1000); --动画时长
      alpha.setRepeatCount(0); --重复次数
      alpha.setRepeatMode(Animation.RESTART); --是否反向动画
      animationSet.addAnimation(alpha);
      功能遮罩.startAnimation(alpha);

      animationSet= AnimationSet(true); --动画集合
      alpha=AlphaAnimation(1,0)--透明动画
      alpha.setDuration(800); --动画时长
      alpha.setRepeatCount(0); --重复次数
      alpha.setRepeatMode(Animation.RESTART); --是否反向动画
      animationSet.addAnimation(alpha);
      文件功能按钮.startAnimation(alpha);

      animationSet= AnimationSet(true); --动画集合
      alpha=AlphaAnimation(1,0)--透明动画
      alpha.setDuration(500); --动画时长
      alpha.setRepeatCount(0); --重复次数
      alpha.setRepeatMode(Animation.RESTART); --是否反向动画
      animationSet.addAnimation(alpha);
      目录功能按钮.startAnimation(alpha);


      功能图片.setImageBitmap(loadbitmap(activity.getLuaDir().."/src/j.png"))

      animationSet= AnimationSet(true); --动画集合
      rotate=RotateAnimation(45, 0,
      Animation.RELATIVE_TO_SELF, 0.5,
      Animation.RELATIVE_TO_SELF, 0.5)--旋转动画
      rotate.setDuration(500); --动画时长
      rotate.setRepeatCount(0); --重复次数
      rotate.setRepeatMode(Animation.RESTART); --是否反向动画
      animationSet.addAnimation(rotate);
      功能按钮.startAnimation(rotate);

     else
      功能遮罩.setVisibility(View.VISIBLE)
      文件功能按钮.setVisibility(View.VISIBLE)
      目录功能按钮.setVisibility(View.VISIBLE)
      功能判断=true

      import "android.view.animation.Animation"
      import "android.view.animation.AlphaAnimation"
      import "android.view.animation.AnimationSet"
      import "android.view.animation.*"
      animationSet= AnimationSet(true); --动画集合
      alpha=AlphaAnimation(0,1)--透明动画
      alpha.setDuration(1000); --动画时长
      alpha.setRepeatCount(0); --重复次数
      alpha.setRepeatMode(Animation.RESTART); --是否反向动画
      animationSet.addAnimation(alpha);
      功能遮罩.startAnimation(alpha);

      animationSet= AnimationSet(true); --动画集合
      alpha=AlphaAnimation(0,1)--透明动画
      alpha.setDuration(500); --动画时长
      alpha.setRepeatCount(0); --重复次数
      alpha.setRepeatMode(Animation.RESTART); --是否反向动画
      animationSet.addAnimation(alpha);
      文件功能按钮.startAnimation(alpha);

      animationSet= AnimationSet(true); --动画集合
      alpha=AlphaAnimation(0,1)--透明动画
      alpha.setDuration(800); --动画时长
      alpha.setRepeatCount(0); --重复次数
      alpha.setRepeatMode(Animation.RESTART); --是否反向动画
      animationSet.addAnimation(alpha);
      目录功能按钮.startAnimation(alpha);

      功能图片.setImageBitmap(loadbitmap(activity.getLuaDir().."/src/x.png"))

      animationSet= AnimationSet(true); --动画集合
      rotate=RotateAnimation(-45, 0,
      Animation.RELATIVE_TO_SELF, 0.5,
      Animation.RELATIVE_TO_SELF, 0.5)--旋转动画
      rotate.setDuration(500); --动画时长
      rotate.setRepeatCount(0); --重复次数
      rotate.setRepeatMode(Animation.RESTART); --是否反向动画
      animationSet.addAnimation(rotate);
      功能按钮.startAnimation(rotate);


    end
  end
end
function 目录功能按钮.onClick()

  功能遮罩.setVisibility(View.GONE)
  文件功能按钮.setVisibility(View.GONE)
  目录功能按钮.setVisibility(View.GONE)
  功能判断=false

  import "android.view.animation.Animation"
  import "android.view.animation.AlphaAnimation"
  import "android.view.animation.AnimationSet"
  import "android.view.animation.*"
  animationSet= AnimationSet(true); --动画集合
  alpha=AlphaAnimation(1,0)--透明动画
  alpha.setDuration(1000); --动画时长
  alpha.setRepeatCount(0); --重复次数
  alpha.setRepeatMode(Animation.RESTART); --是否反向动画
  animationSet.addAnimation(alpha);
  功能遮罩.startAnimation(alpha);

  animationSet= AnimationSet(true); --动画集合
  alpha=AlphaAnimation(1,0)--透明动画
  alpha.setDuration(800); --动画时长
  alpha.setRepeatCount(0); --重复次数
  alpha.setRepeatMode(Animation.RESTART); --是否反向动画
  animationSet.addAnimation(alpha);
  文件功能按钮.startAnimation(alpha);

  animationSet= AnimationSet(true); --动画集合
  alpha=AlphaAnimation(1,0)--透明动画
  alpha.setDuration(500); --动画时长
  alpha.setRepeatCount(0); --重复次数
  alpha.setRepeatMode(Animation.RESTART); --是否反向动画
  animationSet.addAnimation(alpha);
  目录功能按钮.startAnimation(alpha);


  功能图片.setImageBitmap(loadbitmap(activity.getLuaDir().."/src/j.png"))

  animationSet= AnimationSet(true); --动画集合
  rotate=RotateAnimation(45, 0,
  Animation.RELATIVE_TO_SELF, 0.5,
  Animation.RELATIVE_TO_SELF, 0.5)--旋转动画
  rotate.setDuration(500); --动画时长
  rotate.setRepeatCount(0); --重复次数
  rotate.setRepeatMode(Animation.RESTART); --是否反向动画
  animationSet.addAnimation(rotate);
  功能按钮.startAnimation(rotate);
  创建目录_dialog()
end
function 文件功能按钮.onClick()


  功能遮罩.setVisibility(View.GONE)
  文件功能按钮.setVisibility(View.GONE)
  目录功能按钮.setVisibility(View.GONE)
  功能判断=false

  import "android.view.animation.Animation"
  import "android.view.animation.AlphaAnimation"
  import "android.view.animation.AnimationSet"
  import "android.view.animation.*"
  animationSet= AnimationSet(true); --动画集合
  alpha=AlphaAnimation(1,0)--透明动画
  alpha.setDuration(1000); --动画时长
  alpha.setRepeatCount(0); --重复次数
  alpha.setRepeatMode(Animation.RESTART); --是否反向动画
  animationSet.addAnimation(alpha);
  功能遮罩.startAnimation(alpha);

  animationSet= AnimationSet(true); --动画集合
  alpha=AlphaAnimation(1,0)--透明动画
  alpha.setDuration(800); --动画时长
  alpha.setRepeatCount(0); --重复次数
  alpha.setRepeatMode(Animation.RESTART); --是否反向动画
  animationSet.addAnimation(alpha);
  文件功能按钮.startAnimation(alpha);

  animationSet= AnimationSet(true); --动画集合
  alpha=AlphaAnimation(1,0)--透明动画
  alpha.setDuration(500); --动画时长
  alpha.setRepeatCount(0); --重复次数
  alpha.setRepeatMode(Animation.RESTART); --是否反向动画
  animationSet.addAnimation(alpha);
  目录功能按钮.startAnimation(alpha);


  功能图片.setImageBitmap(loadbitmap(activity.getLuaDir().."/src/j.png"))

  animationSet= AnimationSet(true); --动画集合
  rotate=RotateAnimation(45, 0,
  Animation.RELATIVE_TO_SELF, 0.5,
  Animation.RELATIVE_TO_SELF, 0.5)--旋转动画
  rotate.setDuration(500); --动画时长
  rotate.setRepeatCount(0); --重复次数
  rotate.setRepeatMode(Animation.RESTART); --是否反向动画
  animationSet.addAnimation(rotate);
  功能按钮.startAnimation(rotate);
  创建文件_dialog()
end
function 个人信息编辑.onClick()
  radiu=360
  Shanxun.提示(0xFFF25D87,{radiu,radiu,radiu,radiu,radiu,radiu,radiu,radiu},"开发中")
end
function 个人签到圆角.onClick()
  激活码_dialog()
end
function 添加好友圆角.onClick()
  radiu=360
  Shanxun.提示(0xFFF25D87,{radiu,radiu,radiu,radiu,radiu,radiu,radiu,radiu},"开发中")
end
function 头像框.onClick()

end

function 个人上传圆角.onClick()
  --渐变动画效果的，中间是安卓跳转动画代码
  activity.newActivity("upload",android.R.anim.fade_in,android.R.anim.fade_out,{dir[#dir]})
end
参数=0
function onKeyDown(code,event)
  if string.find(tostring(event),"KEYCODE_BACK") ~= nil then
    if #dir==1 then
      if 参数+2 > tonumber(os.time()) then
        local path=Environment.getExternalStorageDirectory().getAbsolutePath().."/Shanxun/Download/"
        local file_download=tostring(io.open(path.."download.ini"):read("*a"))
        if file_download:match("(.+)=true")=="Download" then
          activity.moveTaskToBack(true);
          radiu=360
          Shanxun.提示(0xFFF25D87,{radiu,radiu,radiu,radiu,radiu,radiu,radiu,radiu},"后台继续下载文件")
         else
          activity.finish()
        end
       else
        radiu=360
        Shanxun.提示(0xFFF25D87,{radiu,radiu,radiu,radiu,radiu,radiu,radiu,radiu},"再按一次退出应用")
        参数=tonumber(os.time())
      end
      return true
     else
      dir[#dir]=nil
      动画加载_dialog()
      Api.filelist(url,cookie_dir,dir[#dir],function(content)
        文件路径.setText("文件路径："..dir[#dir])
        列表启动(content["data"]["objects"])
        swipeRefreshLayout.setRefreshing(false)
        dialog2.dismiss()
      end,
      function(content)
        dialog2.dismiss()
      end)
    end
  end
end
--开启v4下拉手动刷新
swipeRefreshLayout.setOnRefreshListener(SwipeRefreshLayout.OnRefreshListener{
  onRefresh=function()
    Api.filelist(url,cookie_dir,dir[#dir],function(content)
      --print(content["data"]["objects"][1]["name"])
      列表启动(content["data"]["objects"])
      swipeRefreshLayout.setRefreshing(false)
      radiu=360
      Shanxun.提示(0xFF85C388,{radiu,radiu,radiu,radiu,radiu,radiu,radiu,radiu},"刷新文件列表成功")
    end,
    function(content)
    end)
  end
})
function main(...)
  local content=...
  个人用户名.setText(content["data"]["user"]["nickname"])
  个人邮箱.setText(content["data"]["user"]["user_name"])
  Http.get(Api.avatar_l(url,content["data"]["user"]["id"]),cookie,charset,header,function(code,c,cookie,header)
    if code==200 then
      个人头像.setImageBitmap(loadbitmap(Api.avatar_l(url,content["data"]["user"]["id"])))
     else
    end
  end)
end


function 列表启动(data)
  adapter=NormalAdapter(data,NormalAdapterImpl{
    onCreateViewHolder=function(parent,position)
      if data[position+1]["type"]=="dir" then
        items = item("文件夹列表",data[position+1]["name"],data[position+1]["size"],data[position+1]["date"])
       else
        items = item("文件子列表",data[position+1]["name"],data[position+1]["size"],data[position+1]["date"])
      end
      tag={}
      local view=loadlayout(items,tag)
      view.setTag(tag)
      return view
    end,
    onBindViewHolder=function(holder,position)
      views=holder.view.getTag()
      views.文件子列表a.onLongClick=function()
        if data[position+1]["type"]=="dir" then
          文件夹操作_dialog(data[position+1]["name"],data[position+1]["id"])
         else
          文件操作_dialog(data[position+1]["name"],data[position+1]["id"])
        end
      end
      views.文件子列表a.onClick=function()
        if data[position+1]["type"]=="dir" then
          if data[position+1]["path"]=="/" then
            dir[#dir+1]=dir[#dir]..data[position+1]["name"]
           else
            dir[#dir+1]=dir[#dir].."/"..data[position+1]["name"]
          end
          动画加载_dialog()
          Api.filelist(url,cookie_dir,dir[#dir],function(content)
            文件路径.setText("文件路径："..dir[#dir])
            列表启动(content["data"]["objects"])
            swipeRefreshLayout.setRefreshing(false)
            dialog2.dismiss()
          end,
          function(content)
            dialog2.dismiss()
          end)
         else
          操作_dialog(data[position+1]["name"],data[position+1]["id"])
        end
        return true
      end
    end,

  })
  文件推荐列表.setItemAnimator(DefaultItemAnimator());
  文件推荐列表.setLayoutManager(LinearLayoutManager(this))
  文件推荐列表.setAdapter(adapter)
end



--[[
    Api.filelist(url,cookie_dir,function(content)
      --print(content["data"]["objects"][1]["name"])
    end,
    function(content)
    end)
    Api.download(url,cookie_dir,"xyfK",function(content)
      print(content["data"])
    end,
    function(content)
    end)
    Api.share(url,cookie_dir,"xyfK","",-1,86400,0,"true",function(content)
      print(content["data"])
    end,
    function(content)
    end)
    Api.delfile(url,cookie_dir,"ePiY",function(content)
    end,
    function(content)
    end)
    ]]--


dir=["/"]

function onStart()
  动画加载_dialog()
  Api.filelist(url,cookie_dir,dir[#dir],function(content)
    文件路径.setText("文件路径："..dir[#dir])
    列表启动(content["data"]["objects"])
    swipeRefreshLayout.setRefreshing(false)
    dialog2.dismiss()
  end,
  function(content)
    dialog2.dismiss()
  end)
end