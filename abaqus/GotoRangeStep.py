# Do not delete the following import lines
from abaqus import *
from abaqusConstants import *
import __main__

def GotoRangeStep():
    import visualization
    import xyPlot
    import displayGroupOdbToolset as dgo
    frame_id = len(session.odbs[0].steps['Session Step'].frames) - 1
    session.viewports['Viewport: 1'].odbDisplay.setFrame(step='Session Step', 
        frame=frame_id)


