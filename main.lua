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
    love.graphics.setNewFont(15)
end

function love.draw()
    for i = 1, field.width do
        for j = 1, field.height do
            love.graphics.print(field[i][j], i*20, j*20)
        end
    end
end
