function splitter (inputstr, null)
    if null == nil then
        sep = "%s"
    end
    local t = { } ; i=1
    for str in string.gmatch(inputstr, "([^"..null.."]+)") do
        t[i] = str
        i = i + 1
    end
    return t
end

Stack = {}
kount = 1
function Stack:Create()

	local t = {}
	t.ent = {}
	function t:push(...)
		if ... then
			local args = {...}
			
			for _,v in ipairs(args) do
				table.insert(self.ent, v)
				kount = kount + 1
			end
		end
	end
	function t:pop()
		tpop = t.ent[kount - 1]
		kount = kount - 1
		table.remove(self.ent)
		return tpop
	end

	function t:getn(num)
		tget = t.ent[num]
		return tget
	end

	function t:list()
		for i, v in pairs(self.ent) do
			print(i, v)
		end
	end
	
	return t
end

function InfixToPostfix (inputstr)
    tokens = splitter(inputstr, "%s")
    count = 0
    for __ in pairs(tokens) do count = count + 1 end
    x = 1
    postfix = { }
    operators = Stack:Create()
	kount = 1
	--Loop ends after count amount of tokens are inserted into the postfix table
	while (x < count+1)
	do
    	for i, v in pairs(tokens) do
			--[[If the token is an operator, the program checks the operators stack
			if the stack is empty the operator is placed in the stack. if the stack
			is not empty the stack is checked for precedence and things are adjusted
			as discussed in class.]]
        	if v == "-" or v == "+" or v == "*" or v == "/" then
				if kount == 1 then
					operators:push(v)
				else
					check = operators:getn(kount-1)
					if v == "*" or v == "/" then
						if check == "-" or check == "+" then
							operators:push(v)
						else
							postfix[x] = check
							x = x + 1
							operators:pop()
							operators:push(v)
						end
					elseif v == "+" or v == "-" then
						z = kount - 1
						while ( z > 0 )
						do
							s = operators:pop()
							postfix[x] = s
							x = x + 1
							z = z - 1
						end
						operators:push(v)
					end
				end
			else
				postfix[x] = v
				x = x + 1
			end
		end
		y = kount - 1
		while ( y > 0 )
		do
			s = operators:pop()
			postfix[x] = s
			x = x + 1
			y = y - 1
		end
	end
	postfix = table.concat(postfix, " ")
	kount = 1

	return postfix
end
