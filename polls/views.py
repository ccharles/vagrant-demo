from django.shortcuts import render
from django.http import HttpResponse
from polls.models import Poll
from django.template import RequestContext, loader
from django.shortcuts import render, get_object_or_404

# Create your views here.
def detail(request, poll_id):
    poll = get_object_or_404(Poll, pk=poll_id)
    return render(request, 'detail.html', {'poll': poll})

def results(request, poll_id):
    response = "You're looking at the results of poll %s."
    return HttpResponse(response % poll_id)

def vote(request, poll_id):
    return HttpResponse("You're voting on poll %s." % poll_id)

def index(request):
    # SELECT * FROM polls ORDER BY pub_date DESC;
    latest_poll_list = Poll.objects.order_by('-pub_date')[:5]
    template = loader.get_template('index.html')
    context = RequestContext(request, {
        'latest_poll_list': latest_poll_list,
    })
    return HttpResponse(template.render(context))
