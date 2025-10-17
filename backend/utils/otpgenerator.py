import random
import string

def otp_generator(length = 8):
    characters = string.ascii_letters + string.digits
    return ''.join(random.choice(characters) for _ in range(length))

if __name__ == "__main__":
    print(otp_generator())