project "vorbis"
    kind "StaticLib"
    language "C"
    staticruntime "on"

    targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
    objdir ("%{wks.location}/bin-int/" .. outputdir .. "/%{prj.name}")

    files
    {
        "lib/**.h",
        "lib/**.c"
    }
    
    removefiles 
    {
        "lib/psytune.c",
        "lib/misc.c"
    }

    includedirs
    {
        "include",
        "%{IncludeDir.ogg}"
    }

    defines
    {
        "_USE_MATH_DEFINES"
    }

    filter "system:windows"
        systemversion "latest"

    filter "configurations:Debug"
        runtime "Debug"
        symbols "on"

    filter "configurations:Release"
        runtime "Release"
        optimize "on"