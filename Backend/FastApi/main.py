import uvicorn
from fastapi import FastAPI
from pydantic import BaseModel

app = FastAPI(title='Learning RestAPI',
              description='An API running on FastAPI + uvicorn')

class Profile(BaseModel):
    name: str = ""
    number: str = "000 0000 0000"

profiles = [
    Profile(name='The Made', number="080 5848 1324",)
]

@app.get("/profiles")
async def get_profiles():
    return profiles

@app.post("/profile")
async def add_profile(profile:Profile):
    profiles.append(profile)


if __name__ == "__main__":
    uvicorn.run(app, host="localhost", port=8000)