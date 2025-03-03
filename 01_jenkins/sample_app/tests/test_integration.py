import os
import urllib.request

def test_integration():
    assert urllib.request.urlopen(os.getenv("STAGING_URL")).status == 200