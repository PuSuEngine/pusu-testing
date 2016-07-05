from pypusu.threaded import PuSuClient, PyPuSuConnectionError
import settings
from tornado import ioloop
from time import time, sleep


def get_pusu_client(authorization=""):
    client = PuSuClient(settings.PUSUD)
    client.authorize(authorization)
    return client


if __name__ == "__main__":
    client = get_pusu_client()

    def tick():
        global client
        ts = str(time())
        print("Tick... {}".format(ts))
        retries = 5
        while retries > 0:
            try:
                client.publish("time.py", ts)
                break
            except PyPuSuConnectionError:
                print("Connection error, retrying...")
                sleep(1)
                client = get_pusu_client()
                retries -= 1


    print("Setting up IOLoop")
    loop = ioloop.IOLoop.instance()
    print("Setting up tick")
    pc = ioloop.PeriodicCallback(tick, 250)
    print("Starting up tick")
    pc.start()
    print("Starting loop")
    loop.start()

    print("Done...")
