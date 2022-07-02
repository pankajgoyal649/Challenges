import requests
import json


def get_metadata(url):
    response = requests.get(url)
    text = response.text
    get_list = text.splitlines()
    out_dict = {}

    for i in get_list:
        if i[-1] == '/':
            new_url = url +i
            list2 = requests.get(new_url).text.splitlines()
            new_dict = {}
            for j in list2:
                new_url1 = new_url + j
                if j[-1] == '/':
                    response1 = requests.get(new_url1).text
                    new_dict1 = {}
                    for k in response1.splitlines():
                        new_url2 = new_url1 + k
                        if k[-1] == '/':
                            response2 = requests.get(new_url2).text
                            new_dict2 = {}
                            for l in response2.splitlines():
                                new_url3 = new_url2 + l
                                if l[-1] == '/':
                                    response3 = requests.get(new_url3).text
                                    new_dict4 = {}
                                    for m in response3.splitlines():
                                        new_url4 = new_url3 + m
                                        if m[-1] == '/':
                                            new_dict4[m[:-1]] = requests.get(new_url4).text
                                        else:
                                            new_dict4[m] = requests.get(new_url4).text
                                    new_dict[l[:-1]] = new_dict4
                                else:
                                    new_dict2[l] = requests.get(new_url3).text
                            new_dict1[k[:-1]] = new_dict2
                        else:
                            new_dict1[k] = requests.get(new_url2).text
                    new_dict[j[:-1]] = new_dict1
                else:
                    new_dict[j] = requests.get(new_url1).text
            out_dict[i[:-1]] = new_dict

        else:
            new_url = url + i
            out_dict[i] = requests.get(new_url).text

    r = json.dumps(out_dict)
    out_json = json.loads(r)

    return out_json

if __name__ == '__main__':
    print(get_metadata("http://169.254.169.254/latest/meta-data/"))