@echo ON
setlocal enabledelayedexpansion

:: cmake -LAH -G "Visual Studio 15 2017 Win64"

set HTTP_PROXY=http://127.0.0.1:10809
set HTTPS_PROXY=http://127.0.0.1:10809

set UNIX_PREFIX=%PREFIX:\=/%
set UNIX_LIBRARY_PREFIX=%LIBRARY_PREFIX:\=/%
set UNIX_LIBRARY_BIN=%LIBRARY_BIN:\=/%
set UNIX_LIBRARY_INC=%LIBRARY_INC:\=/%
set UNIX_LIBRARY_LIB=%LIBRARY_LIB:\=/%
set UNIX_SP_DIR=%SP_DIR:\=/%
set UNIX_SRC_DIR=%SRC_DIR:\=/%

mkdir build
cd build

cmake -LAH -G "Visual Studio 16 2019" -A x64 ^
    -DCMAKE_BUILD_TYPE="Release" ^
    -DCMAKE_INSTALL_PREFIX=%UNIX_LIBRARY_PREFIX% ^
    -DCMAKE_PREFIX_PATH=%UNIX_LIBRARY_PREFIX% ^
    -DBUILD_CPP_EXAMPLES=OFF ^
    -DBUILD_SHARED_LIBS=ON ^
    -DBUILD_EXAMPLES=OFF ^
    -DBUILD_PYTHON_MODULE=OFF ^
    -DBUILD_PYBIND11=OFF ^
    -DENABLE_JUPYTER=OFF ^
    -DBUILD_GUI=OFF ^
    -DENABLE_HEADLESS_RENDERING=OFF ^
    -DSTATIC_WINDOWS_RUNTIME=OFF ^
    -DUSE_BLAS=OFF ^
    -DUSE_SYSTEM_EIGEN3=OFF ^
    -DUSE_SYSTEM_FLANN=ON ^
    -DUSE_SYSTEM_JPEG=ON ^
    -DUSE_SYSTEM_PNG=ON ^
    -DUSE_SYSTEM_GLEW=ON ^
    -DUSE_SYSTEM_GLFW=ON ^
    -DUSE_SYSTEM_PYBIND11=ON ^
    ..

if errorlevel 1 exit 1

cmake --build . --target install --config Release
if errorlevel 1 exit 1

exit 0