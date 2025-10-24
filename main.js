const { app, BrowserWindow } = require('electron')
const path = require('path')

function createWindow () {
  const win = new BrowserWindow({
    width: 900,
    height: 700,
    webPreferences: {
      preload: path.join(__dirname, 'preload.js')
    },
    alwaysOnTop: true,
    frame: false,
    transparent: true,
    resizable: true,
    hasShadow: true
  })

  win.loadFile('index.html')
  win.setMenuBarVisibility(false)

  win.webContents.on('before-input-event', (event, input) => {
    if (input.key === 'Escape') { win.close() }
  })
}

app.whenReady().then(() => {
  createWindow()
  app.on('activate', function () {
    if (BrowserWindow.getAllWindows().length === 0) createWindow()
  })
})

app.on('window-all-closed', function () {
  if (process.platform !== 'darwin') app.quit()
})
