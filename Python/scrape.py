
import requests
from bs4 import BeautifulSoup

def scrape_images(url):
    # Make a GET request to the specified URL
    response = requests.get(url)
    # Parse the HTML content
    soup = BeautifulSoup(response.content, 'html.parser')
    # Find all image tags
    images = soup.find_all('img')
    # Extract the image URLs
    image_urls = [img['src'] for img in images if 'src' in img.attrs]
    return image_urls
