require'snippets'.snippets = {
    -- The _global dictionary acts as a global fallback.
    -- If a key is not found for the specific filetype, then
    --  it will be lookup up in the _global dictionary.
    _global = {
        -- Insert a basic snippet, which is a string.
        todo = "TODO: ",
        uname = function() return vim.loop.os_uname().sysname end
    }
}
