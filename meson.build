project(
    'telegram-glib',
    
    ['c', 'vala'],
    default_options: [
        'warning_level=2'
    ],
    version: '1.0.5',
    meson_version: '>= 0.50.0',
)

pkg = import('pkgconfig')

api_version = '1.0'
lib_name = meson.project_name() + '-' + api_version
typelib_name = 'Telegram-' + api_version

subdir('src')

# Generate documentation
if get_option('docs').length() > 0
    valadoc = find_program('valadoc')
    
    doc_cmd_base = [
        valadoc,
        
        '--package-name=' + lib_name,
        '--package-version=' + meson.project_version(),
        '--target-glib=2.58',
        '--force',
        '--pkg=glib-2.0',
        '--pkg=gobject-2.0',
        '--pkg=gee-0.8',
        '--pkg=libsoup-3.0',
        '--pkg=json-glib-1.0',
        '--directory=@OUTPUT@',
        '@INPUT@'
    ]
    
    if get_option('docs').contains('valadoc')
        valadoc_cmd = [doc_cmd_base, '--doclet=html']
        
        custom_target(
            'valadoc',
            
            command: valadoc_cmd,
            input: lib_sources,
            output: 'valadoc',
            depends: lib,
            install: true,
            install_dir: get_option('datadir') / 'doc' / lib_name)
    endif
    
    if get_option('docs').contains('gtkdoc')
        gtkdoc_cmd = [doc_cmd_base,
            '--doclet=gtkdoc',
            '--doclet-arg=' + (meson.current_build_dir() / 'src' / (lib_name + '.h'))
        ]
        
        custom_target(
            'gtkdoc',
            
            command: gtkdoc_cmd,
            input: lib_sources,
            output: 'gtkdoc',
            depends: lib,
            install: true,
            install_dir: get_option('datadir') / 'doc' / lib_name)
    endif
endif

