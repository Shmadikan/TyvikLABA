import asyncio
from src.database import init_db, AsyncSessionLocal
from src.models import User

async def seed():
    await init_db()
    async with AsyncSessionLocal() as session:
        users = [
            User(name="Alice"),
            User(name="Bob"),
            User(name="Charlie"),
            User(name="Diana"),
        ]
        session.add_all(users)
        await session.commit()
        print("Database seeded with 4 users")

if __name__ == "__main__":
    asyncio.run(seed())

#fff