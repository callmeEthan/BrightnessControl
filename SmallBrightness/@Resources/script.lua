function Initialize()
	local IconSize=tonumber(SKIN:GetVariable('IconSize','30'))
	local RingSize=tonumber(SKIN:GetVariable('RingSize','150'))
	local IconPadding=tonumber(SKIN:GetVariable('IconPadding','10'))

	SKIN:Bang('!SetOption','MeterIcon','W',IconSize)
	SKIN:Bang('!SetOption','MeterIcon','H',IconSize)
	SKIN:Bang('!SetOption','MeterIcon','X',(RingSize/2)-(IconSize/2)-IconPadding)
	SKIN:Bang('!SetOption','MeterIcon','Y',(RingSize/2)-(IconSize/2)-IconPadding)
	SKIN:Bang('!SetOption','MeterIcon','Padding',IconPadding..','..IconPadding..','..IconPadding..','..IconPadding)

	mode=0
end

function execute(x,y)
	local angle = math.deg(math.atan2(y - 50, x - 50)) + 90
	if angle < 0 then angle = angle + 360 end
	local output = round(angle/3.6,0)
	SKIN:Bang('[!WriteKeyValue Variables Value '..(output*0.01)..']')
	SKIN:Bang('[!SetVariable Value '..(output*0.01)..']')
	SKIN:Bang('[!UpdateMeasure ValueMeasure][!UpdateMeter Round][!Redraw]')
	SKIN:Bang('["#CURRENTPATH#\ScreenBright.exe" -set screen 1 brightness '..output..' screen 2 brightness '..output..' screen 3 brightness '..output..']')
end

function round(num, numDecimalPlaces)
  local mult = 10^(numDecimalPlaces or 0)
  return math.floor(num * mult + 0.5) / mult
end