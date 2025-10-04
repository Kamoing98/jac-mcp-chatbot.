jac
use server.impl
use mcp_server

walker chat_handler {
    param:
        input_text: str
    body:
        print("Received:", input_text)
        response = mcp_server.handle_query(input_text)
        return response
}

walker file_handler {
    param:
        file_data: file
    body:
        print("Uploading file:", file_data.name)
        result = mcp_server.handle_file(file_data)
        return result
}

arch server {
    can:
        handle_chat(text: str) -> str:
            return -> chat_handler(input_text=text)

        handle_upload(file: file) -> str:
            return -> file_handler(file_data=file)
}

deploy:
    spawn server