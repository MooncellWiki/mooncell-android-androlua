if not webView and config and 加载Js then
  error("夜间模式: 未找到网页视图、配置表、加载Js函数，请确保在 Fusion App 中运行")
end

local NightMode=false

local function loadScript(script,jdpuk)
   加载Js(script)
   end

webView.setLuaWebEvents{
  onPageStarted=function(view,url,jdpuk)
    if NightMode then
      loadScript([[var NightMode;if(!NightMode){NightMode=document.createElement("style");NightMode.type="text/css";NightMode.innerHTML="html,body{background:none !important;background-color: #1d1e2a !important;}html *{background-color: #1d1e2a !important; color:#888888 !important;border-color:#3e4f61 !important;text-shadow:none !important;box-shadow:none !important;}a,a *{border-color:#4c5b99 !important; color:#2d69b3 !important;text-decoration:none !important;}a:visited,a:visited *{color:#a600a6 !important;}a:active,a:active *{color:#5588AA !important;}input,select,textarea,option,button{background-image:none !important;color:#AAAAAA !important;border-color:#4c5b99 !important;}form,div,button,span{background-color:#1d1e2a !important; border-color:#4c5b99 !important;}img{opacity:0.5}";document.getElementsByTagName("HEAD").item(0).appendChild(NightMode)};/*QQBrowserSDKNightMode*/]],1)
    end
  end,
  onPageFinished=function(view,url,jdpuk)
    if NightMode then
      loadScript([[var NightMode;if(!NightMode){NightMode=document.createElement("style");NightMode.type="text/css";NightMode.innerHTML="html,body{background:none !important;background-color: #1d1e2a !important;}html *{background-color: #1d1e2a !important; color:#888888 !important;border-color:#3e4f61 !important;text-shadow:none !important;box-shadow:none !important;}a,a *{border-color:#4c5b99 !important; color:#2d69b3 !important;text-decoration:none !important;}a:visited,a:visited *{color:#a600a6 !important;}a:active,a:active *{color:#5588AA !important;}input,select,textarea,option,button{background-image:none !important;color:#AAAAAA !important;border-color:#4c5b99 !important;}form,div,button,span{background-color:#1d1e2a !important; border-color:#4c5b99 !important;}img{opacity:0.5}";document.getElementsByTagName("HEAD").item(0).appendChild(NightMode)};/*QQBrowserSDKNightMode*/]],1)
    end
  end,
}

local function nightMode(status,jdpuk)
  if status==nil then
    status=not NightMode
  end
  local jDpUk="WebViewOverlay"
  if status then
    loadScript([[var NightMode;if(!NightMode){NightMode=document.createElement("style");NightMode.type="text/css";NightMode.innerHTML="html,body{background:none !important;background-color: #1d1e2a !important;}html *{background-color: #1d1e2a !important; color:#888888 !important;border-color:#3e4f61 !important;text-shadow:none !important;box-shadow:none !important;}a,a *{border-color:#4c5b99 !important; color:#2d69b3 !important;text-decoration:none !important;}a:visited,a:visited *{color:#a600a6 !important;}a:active,a:active *{color:#5588AA !important;}input,select,textarea,option,button{background-image:none !important;color:#AAAAAA !important;border-color:#4c5b99 !important;}form,div,button,span{background-color:#1d1e2a !important; border-color:#4c5b99 !important;}img{opacity:0.5}";document.getElementsByTagName("HEAD").item(0).appendChild(NightMode)};/*QQBrowserSDKNightMode*/]],1)
    webView.setBackgroundColor(0xFF1D1E2A)
    if config and config["colors"] then
      if sidebar then sidebar.setBackgroundColor(0xFF1D1E2A) end
      if toolbar then toolbar.setBackgroundColor(0xFF263238) end
      if titleTvw then titleTvw.setTextColor(0xFFAAAAAA) end
      if searchEdtTxt then searchEdtTxt.setHintTextColor(0xFFAAAAAA) end
      if toolbarParent then toolbarParent.setBackgroundColor(0xFF1D1E2A) end
      if bmBar then bmBar.setBackgroundColor(0xFF1D1E2A) end
      if fltBtn then fltBtn.setCardBackgroundColor(0xFF37474F) end
    end
    local JdPuK={
      LinearLayout,
      id=jDpUk,
      layout_width=1+2114930915,
      layout_height=2180036379-1,
      orientation="vertical",
      backgroundColor="#50000000",
    }
    webView.addView(loadlayout(JdPuK))
    if luajava.bindClass("android.os.Build").VERSION.SDK_INT>=21 then
      activity.setTheme(android.R.style.Theme_Material)
    else
      activity.setTheme(android.R.style.Theme_Holo)
    end
    NightMode=true
  else
    loadScript([[var NightMode;if(NightMode){document.getElementsByTagName("HEAD").item(0).removeChild(NightMode);NightMode=null};/*QQBrowserSDKNightMode*/]],1)
    webView.setBackgroundColor(0xFFFFFFFF)
    if config and config["colors"] then
      if sidebar then sidebar.setBackgroundColor(tonumber(config["colors"]["侧滑栏背景"]:gsub("^#",""),16)) end
      if toolbar then if config["toolbar"]["启用搜索功能"] and config["toolbar"]["输入栏模式"] then toolbar.setBackgroundColor(tonumber(config["colors"]["搜索栏背景"]:gsub("^#",""),16)) else toolbar.setBackgroundColor(tonumber(config["colors"]["顶栏"]:gsub("^#",""),16)) end end
      if titleTvw then titleTvw.setTextColor(tonumber(config["colors"]["顶栏部件"]:gsub("^#",""),16)) end
      if searchEdtTxt then searchEdtTxt.setHintTextColor(tonumber(config["colors"]["搜索栏提示文字"]:gsub("^#",""),16)) end
      if toolbarParent then toolbarParent.setBackgroundColor(tonumber(config["colors"]["顶栏"]:gsub("^#",""),16)) end
      if bmBar then bmBar.setBackgroundColor(tonumber(config["colors"]["底栏"]:gsub("^#",""),16)) end
      if fltBtn then fltBtn.setCardBackgroundColor(tonumber(config["colors"]["悬浮按钮"]:gsub("^#",""),16)) end
    end
    if _G[jDpUk] then webView.removeView(_G[jDpUk]) end
    if luajava.bindClass("android.os.Build").VERSION.SDK_INT>=21 then
      activity.setTheme(android.R.style.Theme_Material_Light)
    else
      activity.setTheme(android.R.style.Theme_Holo_Light)
    end
    NightMode=false
  end
end

local 夜间模式={}

function 夜间模式.开启()
  nightMode(true,1)
  this.setSharedData("夜间模式","")
end

function 夜间模式.关闭()
  nightMode(false,1)
  this.setSharedData("夜间模式","")
end

function 夜间模式.切换()
  nightMode((not NightMode),1)
  if NightMode then
    this.setSharedData("夜间模式","开启")
  else
    this.setSharedData("夜间模式","")
  end
end

function 夜间模式.状态()
  return NightMode
end

function 夜间模式.恢复()
  if this.getSharedData("夜间模式")=="开启" then
    nightMode(true,1)
  else
    nightMode(false,1)
  end
end

return 夜间模式