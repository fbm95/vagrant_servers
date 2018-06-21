import urllib.request
import threading


def worker():
    for x in range(10000):
        f = urllib.request.urlopen("http://172.17.8.101:1221/host")
        print(f.read())
    return


def main():
    threads = []

    for i in range(100):
        t = threading.Thread(target=worker)
        threads.append(t)
        t.start()


if __name__ == "__main__":
    main()
