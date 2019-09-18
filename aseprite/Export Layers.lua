----------------------------------------------------------------------
-- Exports each layer as a separate file
----------------------------------------------------------------------

local spr = app.activeSprite
if not spr then return end

local data = Dialog()
        :entry {
            id="prefix",
            label="File name prefix"
        }
        :file {
            id="path",
            title="Directory",
            open=false,
            save=true,
            filetypes={ ".png" }
        }
        :button{ id="ok", text="OK" }
        :button{ id="cancel", text="Cancel" }
        :show()
        .data

if data.cancel then return end

fileDir = string.gsub (data.path, "/[^/]*$", "")

for i, layer in ipairs(spr.layers) do
    if layer and layer.isImage then
        fileName = fileDir .. "/" .. data.prefix .. layer.name .. ".png"
        app.command.ExportSpriteSheet {
            ui = false,
            askOverwrite = false,
            type = SpriteSheetType.HORIZONTAL,
            bestFit=true,
            textureFilename = fileName,
            trim = true,
            layer = layer.name,
        }
    end
end
