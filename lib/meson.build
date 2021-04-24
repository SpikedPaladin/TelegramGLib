lib_deps = [
    dependency('glib-2.0'),
    dependency('gobject-2.0'),
    dependency('gee-0.8'),
    dependency('json-glib-1.0'),
    dependency('libsoup-2.4')
]

lib_sources = [
    'telegram-bot.vala',
    'telegram-util.vala',
    'telegram-types.vala',
    'telegram-config.vala',
]

lib = library(lib_name,
    lib_sources,
    dependencies: lib_deps,
    install: true,
    install_dir: [true, true, true]
)

configure_file(
    input: 'deps.in',
    output: '@0@.deps'.format(lib_name),
    copy: true,
    install: true,
    install_dir: get_option('datadir') / 'vala' / 'vapi'
)

pkg.generate(
    name: 'Telegram GLib',
    description: 'Telegram bot API written in Vala',
    
    libraries: lib,
    version: meson.project_version(),
    subdirs: lib_name,
    filebase: lib_name,
    requires: ['gee-0.8', 'json-glib-1.0', 'libsoup-2.4']
)
