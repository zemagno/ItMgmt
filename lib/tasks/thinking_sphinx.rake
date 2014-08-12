# lib/tasks/thinking_sphinx.rake
 
namespace :thinking_sphinx do
  task :run_in_foreground => [ 'ts:conf', 'ts:in' ] do
    thinking_sphinx = ThinkingSphinx::Configuration.instance
 
    # Workaround to make Sphinx die nicely:
    #   - PTY.spawn invokes bash -c under the covers
    #   - Which turns SIGTERM into SIGHUP (not sure exactly why, can't seem to find a reason)
    #   - Which sphinx interprets as a reload instead of a quit
    #   - So, we need to remap HUP to KILL for the purposes of this script.
 
    unless pid = fork
      exec "#{thinking_sphinx.bin_path}#{thinking_sphinx.searchd_binary_name} --pidfile --config #{thinking_sphinx.config_file} --nodetach"
    end
 
    trap("SIGHUP") { Process.kill(:TERM, pid) }
    Process.wait
 
  end
end