lib_deps = [
    dependency('json-glib-1.0'),
    dependency('libsoup-3.0')
]

lib_sources = files(
    'bot.vala',
    'config.vala',
    'delegates.vala',
    'util.vala',
)

subdir('handlers')
subdir('requests')
subdir('types')

install_data(
    'deps.in',
    
    rename: lib_name + '.deps',
    install_dir: get_option('datadir') / 'vala' / 'vapi'
)

lib = library(
    lib_name,
    
    lib_sources,
    vala_gir: typelib_name + '.gir',
    dependencies: lib_deps,
    install: true,
    install_dir: [true, true, true, true]
)

pkg.generate(
    name: 'Telegram GLib',
    description: 'Telegram bot API written in Vala',
    
    libraries: lib,
    version: meson.project_version(),
    subdirs: lib_name,
    filebase: lib_name,
    requires: ['json-glib-1.0', 'libsoup-3.0']
)

if get_option('introspection')
    g_ir_compiler = find_program('g-ir-compiler')
    
    typelib_cmd = [
        g_ir_compiler,
        
        '--shared-library=' + lib.full_path().split('/')[-1],
        '--output=@OUTPUT@',
        meson.current_build_dir() / (typelib_name + '.gir')
    ]
    
    custom_target(
        'typelib',
        
        command: typelib_cmd,
        output: typelib_name + '.typelib',
        depends: lib,
        install: true,
        install_dir: get_option('libdir') / 'girepository-1.0')
endif

