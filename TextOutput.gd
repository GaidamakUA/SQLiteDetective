extends RichTextLabel

class_name TextOutput

func set_result(rows: Array) -> void:
	clear()
	if not rows || rows.size() == 0:
		return
	push_table(rows[0].keys().size())
	for key in rows[0].keys():
		push_cell()
		add_text(key)
		pop()
	
	for row in rows:
		for key in rows[0].keys():
			push_cell()
			add_text(String(row[key]))
			pop()
	pop()

func set_error(message: String) -> void:
	clear()
	append_bbcode("[color=red]%s[/color]" % message)