function setSquareSize()
	local width = field.width
	local height = field.height
	squareSize = math.floor(math.min(
		love.graphics.getHeight() / height,
		love.graphics.getWidth() / width
	))
    love.graphics.setNewFont(0.75*squareSize)
end

function love.resize()
	setSquareSize()
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
    love.window.setMode(
        love.graphics.getWidth(),
        love.graphics.getHeight(),
        {resizable=true, minwidth=50, minheight=50}
    )
    setSquareSize()
end

function drawSquare(square, x, y)
    love.graphics.push()
    love.graphics.translate(x, y)
    love.graphics.scale(squareSize)
    love.graphics.setColor(0.95, 0.95, 0.95)
    love.graphics.polygon("fill", 0, 0, 0, 1, 1, 0)
    love.graphics.setColor(0.4, 0.4, 0.4)
    love.graphics.polygon("fill", 1, 1, 0, 1, 1, 0)
    love.graphics.setColor(0.75, 0.75, 0.75)
    love.graphics.rectangle("fill", 0.1, 0.1, 0.8, 0.8)
    love.graphics.pop()
end

function love.draw()
    love.graphics.translate(love.graphics.getWidth()/2-field.width*squareSize/2, love.graphics.getHeight()/2-field.height*squareSize/2)
    for i = 1, field.width do
        for j = 1, field.height do
            drawSquare(field[i][j], (i-1)*squareSize, (j-1)*squareSize)
        end
    end
end
