async function output(...command: string[]): Promise<string> {
  const process =  Deno.run({cmd: command, stdout: 'piped', stderr: 'piped'})
  const status = await process.status();
  const stdout = await process.output();
  const stderr = await process.stderrOutput();
  if (!status.success) {
    throw Error(new TextDecoder().decode(stderr));
  }
  return (new TextDecoder().decode(stdout));
}

async function execute(...command: string[]): Promise<void> {
  const process =  Deno.run({cmd: command, stderr: 'piped'})
  const status = await process.status();
  const stderr = await process.stderrOutput();
  if (!status.success) {
    throw Error(new TextDecoder().decode(stderr));
  }
  return;
}

export { output, execute };