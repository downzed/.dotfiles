import subprocess
import json

# get the JSON output of the Sway tree and extract the focused window, if it exists
swaymsg_output = subprocess.check_output(['swaymsg', '-t', 'get_tree']).decode('utf-8')
sway_tree = json.loads(swaymsg_output)
focused_window_list = []
for output_node in sway_tree['nodes']:
    if output_node.get('type') == 'workspace':
        workspace_nodes = output_node['nodes'] + output_node['floating_nodes']
        focused_window_list = [node for node in workspace_nodes if node.get('focused')]
        if focused_window_list:
            break

if focused_window_list:
    focused_window = focused_window_list[0]
    # get the application name from the focused window using the 'app_id' attribute, if it exists
    app_id = focused_window.get('app_id')
    if app_id:
        app_name = app_id.split('.')[-1]
    else:
        app_name = 'Unknown Application'
else:
    app_name = 'No focused window'

print(app_name)

