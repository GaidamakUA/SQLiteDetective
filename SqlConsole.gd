extends VBoxContainer

var last_console_number := 1;
var selected_tab := 0;
var tabs_text := PoolStringArray()

func _ready():
	$Tabs.add_tab("Console 0")
	$Tabs.add_tab("+")
	tabs_text.append("")

func get_text() -> String:
	return $TextEdit.text

func _on_Tabs_tab_clicked(tab) -> void:
	print(tabs_text)
	tabs_text.set(selected_tab, get_text())
	selected_tab = tab
	
	if tab == $Tabs.get_tab_count() - 1:
		var tab_name = str("Console ", last_console_number)
		last_console_number += 1
		
		$Tabs.add_tab(tab_name)
		$Tabs.move_tab($Tabs.get_tab_count() - 2, $Tabs.get_tab_count() - 1)
		
		$TextEdit.text = ""
		tabs_text.append("")
	else:
		$TextEdit.text = tabs_text[selected_tab]
	print(tabs_text)

func _on_Tabs_tab_close(tab):
	print(tabs_text)
	if $Tabs.get_tab_count() > 2:
		$Tabs.remove_tab(tab)
		tabs_text.remove(tab)
		selected_tab = $Tabs.current_tab
		$TextEdit.text = tabs_text[selected_tab]
		print(tabs_text)
