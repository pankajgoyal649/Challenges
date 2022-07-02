def get_value_path(obj, path, current_path=""):
    try:
        if type(obj) == dict:
            for k, v in obj.items():
                if current_path != "":
                    current_path = f"{current_path}/{k}"
                else:
                    current_path = k
                if current_path == path:
                    return v
                if type(v) == dict:
                    return get_value_path(v, path, current_path)
    except Exception as exc:
        print("Exception:", exc)
        raise exc

object = {'a':{'b':{'c':'d'}}}
key = 'a/b/c'
if __name__ == '__main__':
    print(get_value_path(object, key))