BUILD_DIR       = "build"
BUILD_LIB_DIR   = "#{BUILD_DIR}/lib"
BUILD_EXE_DIR   = "#{BUILD_DIR}/exe"
MAIN_SOURCE     = "src/crmrb.cr"
MAIN_EXECUTABLE = "#{BUILD_EXE_DIR}/crmrb"
EXT_SOURCE      = "src/ext/crmrb.c"
EXT_LIBRARY     = "#{BUILD_LIB_DIR}/crmrb.o"
EXT_ARCHIVE     = "#{BUILD_LIB_DIR}/libcrmrb.a"
SOURCE_FILES    = FileList["src/**/*.{c,cr}"]

file BUILD_LIB_DIR do
  mkdir_p BUILD_LIB_DIR
end

file EXT_LIBRARY => [BUILD_LIB_DIR, EXT_SOURCE] do
  sh "cc -Wall -Werror -c -o #{EXT_LIBRARY} #{EXT_SOURCE}"
end

file EXT_ARCHIVE => [BUILD_LIB_DIR, EXT_LIBRARY] do
  sh "ar rcs #{EXT_ARCHIVE} #{EXT_LIBRARY}"
end

file BUILD_EXE_DIR do
  mkdir_p BUILD_EXE_DIR
end

file MAIN_EXECUTABLE => SOURCE_FILES + [BUILD_EXE_DIR, EXT_ARCHIVE] do
  sh "crystal build #{MAIN_SOURCE} -o #{MAIN_EXECUTABLE}"
end

desc "Clean generated files"
task :clean do
  rm_rf BUILD_DIR
end

desc "Build the project"
task build: MAIN_EXECUTABLE

task default: :build
