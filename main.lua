function love.load()
  love.window.setMode(600,600)
  myFrame = frame({
      x=0,
      y=0,
      w=love.graphics.getWidth(),
      h=love.graphics.getHeight(),
      rows=4,
      cols=4,
      margin = 16
  })
  cell1 = myFrame.position({
      row=1,
      col=0,
      colSpan = 4
  })
  cell2 = myFrame.position({
      row=2,
      col=2,
      colSpan = 2,
      rowSpan = 2,
  })

  innerFrame = frame({
      x=cell2.x,
      y=cell2.y,
      w=cell2.w,
      h=cell2.h,
      rows=3,
      cols=3,
      margin=16
  })

  cell3 = innerFrame.position({
      row=0,
      col=0,
  })
  cell4 = innerFrame.position({
      row=1,
      col=1,
  })
  cell5 = innerFrame.position({
      row=2,
      col=2,
  })

  cell6 = myFrame.position({row=0,col=1,rowSpan=4})
  innerFrame2 = frame({
      x=cell6.x,
      y=cell6.y,
      w=cell6.w,
      h=cell6.h,
      rows = 11,
  })

  cell7 = innerFrame2.position({row=2})
  cell8 = innerFrame2.position({row=4})
  cell9 = innerFrame2.position({row=6})
  cell10 = innerFrame2.position({row=8})

  listCell = myFrame.position({row=0,col=2,colSpan=2})

  list = {'one','four','apple','pants','backpack'}
end

function love.update()
end

function love.draw()
  love.graphics.setColor(1,1,1)
  love.graphics.rectangle("line", myFrame.x, myFrame.y, myFrame.w, myFrame.h)

  love.graphics.setColor(1,0,1)
  love.graphics.rectangle("fill", cell1.x, cell1.y, cell1.w, cell1.h)

  love.graphics.setColor(.5,1,.5)
  love.graphics.rectangle("fill", cell2.x, cell2.y, cell2.w, cell2.h)

  love.graphics.setColor(0,0,1)
  love.graphics.rectangle("fill", cell3.x, cell3.y, cell3.w, cell3.h)

  love.graphics.setColor(0,0,1)
  love.graphics.rectangle("fill", cell4.x, cell4.y, cell4.w, cell4.h)

  love.graphics.setColor(0,0,1)
  love.graphics.rectangle("fill", cell5.x, cell5.y, cell5.w, cell5.h)

  love.graphics.setColor(0,1,1)
  love.graphics.rectangle("fill", cell7.x, cell7.y, cell7.w, cell7.h)

  love.graphics.setColor(0,1,1)
  love.graphics.rectangle("fill", cell8.x, cell8.y, cell8.w, cell8.h)

  love.graphics.setColor(0,1,1)
  love.graphics.rectangle("fill", cell9.x, cell9.y, cell9.w, cell9.h)

  love.graphics.setColor(0,1,1)
  love.graphics.rectangle("fill", cell10.x, cell10.y, cell10.w, cell10.h)


  love.graphics.rectangle("line", listCell.x, listCell.y, listCell.w, listCell.h)
  for i, item in ipairs(list) do
    love.graphics.printf(item, listCell.x+8, listCell.y + 8 +  ((i-1)*18), listCell.w-16, 'right')
  end
end

function frame(opts)
  local frame = {}
  frame.x = opts and opts.x or 0
  frame.y = opts and opts.y or 0
  frame.w = opts and opts.w or 100
  frame.h = opts and opts.h or 100
  frame.cols = opts and opts.cols or 1
  frame.rows = opts and opts.rows or 1
  frame.margin = opts and opts.margin or 0

  function frame.position(opts)
    local row = opts and opts.row or 0
    local col = opts and opts.col or 0
    local rowSpan = opts and opts.rowSpan or 1
    local colSpan = opts and opts.colSpan or 1
    if row + rowSpan  > frame.rows then
      error('row out of bounds')
    end
    if col + colSpan > frame.cols then
      error('col out of bounds')
    end
    cell = {}
    cell.x = frame.w/frame.cols * col + frame.x + frame.margin
    cell.y = frame.h/frame.rows * row + frame.y + frame.margin
    cell.w = frame.w/frame.cols * colSpan - (2*frame.margin)
    cell.h = frame.h/frame.rows * rowSpan - (2*frame.margin)
    return cell
  end

  return frame
end
