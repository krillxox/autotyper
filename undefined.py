import sys
import cv2
import pytesseract
def main():
    img = cv2.imread(sys.argv[1])
    # print
    # print(sys.argv[1])
    print(pytesseract.image_to_string(img))
    
    
# if __name__ == '__main__':
main()
