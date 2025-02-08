# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Release")
  file(REMOVE_RECURSE
  "CMakeFiles\\app2_autogen.dir\\AutogenUsed.txt"
  "CMakeFiles\\app2_autogen.dir\\ParseCache.txt"
  "app2_autogen"
  )
endif()
