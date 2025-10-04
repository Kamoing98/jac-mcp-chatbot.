can query_tool(prompt: str) -> str:
    """
    Sends a user prompt to the tool server for processing.
    """
    return mcp_server.handle_query(prompt)

can upload_file(file_data: file) -> str:
    """
    Sends a file to the tool server for indexing and processing.
    """
    return mcp_server.handle_file(file_data)