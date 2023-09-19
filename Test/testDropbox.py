import dropbox

dbx = dropbox.Dropbox('sl.BmXkn-OP2QLL5pA726cAMjwckRwMdQMk4QQcTL5vBCY7bd-_vjQPKYgrEubIAbBWiHg_YfRCd6I5odGo6tndfpasw9SBjlr1Sr1nU1XTrgYTeDr65kkZBnqWRNtsnNV-SeNMSnSZoPLW')

# Replace 'url' with your file's path
path = "/url.png"

# Get the metadata for a file
try:
    metadata = dbx.files_get_metadata(path)
    print(metadata)
except dropbox.exceptions.ApiError as err:
    print(f"API error: {err}")
