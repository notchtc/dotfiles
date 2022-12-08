function fish_prompt
	if test $status != 0
		echo (set_color red)(prompt_pwd)(set_color normal)" "
	else
		echo (set_color green)(prompt_pwd)(set_color normal)" "
	end
end
