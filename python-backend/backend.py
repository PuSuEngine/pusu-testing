from pypusu.threaded import PuSuClient
import settings
from tornado import ioloop
from time import time


if __name__ == "__main__":
    client = PuSuClient(settings.PUSUD)
    client.authorize("")

    def tick():
        ts = str(time())
        print("Tick... {}".format(ts))
        client.publish("time.py", ts)

    print("Setting up IOLoop")
    loop = ioloop.IOLoop.instance()
    print("Setting up tick")
    pc = ioloop.PeriodicCallback(tick, 25)
    print("Starting up tick")
    pc.start()
    print("Starting loop")
    loop.start()

    print("Done...")


