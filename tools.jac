can handle_query(input_text: str) -> str:
    """
    Handles a natural language query using LLM tools or document search.
    """
    # First try searching indexed documents
    doc_result = tools.search_documents(input_text)

    if doc_result != "":
        return f"Document Search Result: {doc_result}"
    
    # If no relevant document found, use LLM response
    llm_response = tools.query_llm(input_text)
    return f"LLM Response: {llm_response}"

can handle_file(file_data: file) -> str:
    """
    Handles file upload by processing and indexing it.
    """
    success = tools.index_document(file_data)

    if success:
        return "File indexed successfully."
    else:
        return "Failed to index file."
