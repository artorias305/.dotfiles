return {
	"atiladefreitas/dooing",
	config = function()
		require("dooing").setup({
			due_notifications = {
				enabled = false
			}
		})
	end
}
