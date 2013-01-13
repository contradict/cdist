state_is="$(cat "$__object/explorer/state")"
state_should="$(cat "$__object/parameter/state")"

if [ -f "$__object/parameter/version" ]; then
    version=$( cat "$__object/parameter/version" )
else
    version="5.0.35"
fi

version_installed="$(cat "$__object/explorer/version" )"

[ "$version_installed" = "$version" ] && exit 0
[ "$state_is" = "$state_should" ] && exit 0

if [ -f "$__object/parameter/force_ubuntu_release" ]; then
    ubuntu_release=$( cat "$__object/parameter/force_ubuntu_release" )
else
    ubuntu_release=$( cat "$__global/explorer/os_version" )
fi

machine=$(cat "$__global/explorer/machine")
case $machine in
    x86_64)
        bits="64"
    ;;
    *)
        echo "Unknown machine $machine" >&2
        exit 1
    ;;
esac

version_major=`echo $version | cut -d'.' -f1`
version_minor=`echo $version | cut -d'.' -f2`
version_release=`echo $version | cut -d'.' -f3`

if [ -e "$__object/parameter/update" ]; then
    update="$(cat "$__object/parameter/update")"
else
    update=""
fi

if [ "${update}" = "" ]; then
    ext=".run"
    rel=""
else
    ext="-${update}.run"
    rel="-update-${update}"
fi

if [ "$version_release" = "" ]; then
    verstring=${version_major}.${version_minor}
else
    verstring=${version_major}.${version_minor}.${version_release}
fi

#cuda_5.0.35_linux_64_ubuntu11.10-1.run
filename=cuda_${verstring}_linux_${bits}_ubuntu${ubuntu_release}${ext}

