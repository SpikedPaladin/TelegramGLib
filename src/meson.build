lib_deps = [
    dependency('glib-2.0'),
    dependency('gobject-2.0'),
    dependency('gee-0.8'),
    dependency('json-glib-1.0'),
    dependency('libsoup-3.0')
]

lib_sources = [
    'bot.vala',
    'util.vala',
]

subdir('requests')
subdir('types')

lib = library(lib_name,
    lib_sources,
    dependencies: lib_deps,
    install: true,
    install_dir: [true, true, true]
)

configure_file(
    input: 'deps.in',
    output: lib_name + '.deps',
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
    requires: ['gee-0.8', 'json-glib-1.0', 'libsoup-3.0']
)