function setSquareSize()
	local width = field.width
	local height = field.height
	squareSize = math.floor(math.min(
		love.graphics.getHeight() / height,
		love.graphics.getWidth() / width
	))
end

function love.load()
    field = {
        width = 20,
        height = 20
    }
    for i = 1, field.width do
        field[i] = {}
        for j = 1, field.height do
            field[i][j] = 0
        end
    end
    setSquareSize()
    love.graphics.setNewFont(0.75*squareSize)
end

function love.draw()
    for i = 1, field.width do
        for j = 1, field.height do
            love.graphics.print(field[i][j], i*squareSize, j*squareSize)
        end
    end
end
