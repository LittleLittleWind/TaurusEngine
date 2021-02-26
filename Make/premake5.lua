workspace "Taurus"
    configurations { "Debug", "Release" }
    location "Generated"
    language "C++"
    architecture "x86_64"
	
	filter "configurations:Debug"
		symbols "On"
	
	filter "configurations:Release"
		optimize "On"

    filter { }
	-- Here we use some "tokens" (the things between %{ ... }). They will be replaced by Premake
	-- automatically when configuring the projects.
	-- The path is relative to *this* folder
	targetdir ("Build/Bin/%{prj.name}/%{cfg.longname}")
    objdir ("Build/Obj/%{prj.name}/%{cfg.longname}")
    
project "App"
	kind "ConsoleApp"
	files {"../Runtime/**", "../Platform/WinPlayer/glad/src/**"}

    includedirs {"$(ProjectDir)../../Platform/WinPlayer/SDL2/include", "$(ProjectDir)../../Platform/WinPlayer/glad/include"}
    libdirs "$(ProjectDir)../../Platform/WinPlayer/SDL2/lib/x64"
    debugenvs "PATH=%PATH%;$(ProjectDir)../../Platform/WinPlayer/SDL2/lib/x64"
    -- runpathdirs "../Platform/WinPlayer/SDL2/lib/x64"
    links {"SDL2.lib", "SDL2main.lib"}
	
	-- filter { "system:windows" }
	-- 	links { "OpenGL32" }
		
	-- filter { "system:not windows" }
	-- 	links { "GL" }