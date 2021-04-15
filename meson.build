project('telegram-glib', ['c', 'vala'],
    default_options: [
        'warning_level=2'
    ],
    
    version: '0.1.1',
    meson_version: '>= 0.50.0',
)

pkg = import('pkgconfig')

api_version = '0.1'
lib_name = '@0@-@1@'.format(meson.project_name(), api_version)

subdir('lib')
