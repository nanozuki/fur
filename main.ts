import { Homebrew } from './controllers/homebrew.ts'

interface Controller {
    sync(): Promise<void>
}

async function main() {
    const brew = await Homebrew.new();
    brew.pkg('fish', 'neovim');
    await brew.sync()
}

await main();