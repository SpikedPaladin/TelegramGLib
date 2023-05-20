project('telegram-glib', ['c', 'vala'],
    default_options: [
        'warning_level=2'
    ],
    
    version: '0.1.4',
    meson_version: '>= 0.50.0',
)

pkg = import('pkgconfig')

api_version = '0.1'
lib_name = meson.project_name() + '-' + api_version

subdir('src')
